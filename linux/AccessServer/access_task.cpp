#include "Framework/z_event.h"
#include "Framework/z_tcpserver.h"
#include "Framework/z_encoder.h"
#include "Framework/z_decoder.h"
#include "Framework/z_stl.h"
#include "Framework/z_time.h"

#include "Cmd/utils.h"
#include "Cmd/server.pb.h"

#include "GameLib/utils/u_bitset.h"
#include "GameLib/icpack/TexasPacketHandle.h"

#include "access_task.h"
#include "access_task_manager.h"
#include "access_intertask_manager.h"
#include "access_server.h"
#include "access_task_parser.h"
#include "access_httpclient.h"
#include "access_intertask.h"

AccessTask::AccessTask(const int32 nfd) :
	m_proxyLoginStr(""),
	m_bev(NULL),
	m_loginid(0),
	m_isbinduid(false),
	m_em(AccessServer::getInstance().getMainEvent()),
	m_mod(0)
{
	m_fd = nfd;

	m_linkId = 0;
	m_chatId = 0;
	m_clientType=0;
	memset(m_flags, 0, sizeof(m_flags));
	ZTRACE("Construct AccessTask:[ %p ,%d]", this, handle());
}

AccessTask::~AccessTask() {
	ZTRACE("Deallocate AccessTask:[ %p ,%d,%p]", this, handle(), m_bev);

	destroy();

	if(m_bev) {
		bufferevent_free(m_bev);
		m_bev = NULL;
	}

}

void AccessTask::destroy() {
	ZTRACE("destroy AccessTask:[ %p ,%llu,%d,%p]", this, id(), handle(), m_bev);
	if(m_isbinduid) {
		onLogout();
	}
	m_fd = -1;
	m_isbinduid = 0;
	m_proxyLoginStr.clear();
	AccessTaskManager::getInstance().removeTask(this);
	AccessTaskVerifyManager::getInstance().removeTask(this);
}

int32 AccessTask::handleHeadPacket(const char* data, const uint16 dlen) {
	int32 res = -1;
	if(-1 == res) {//HAProxy
		BPTHAProxyHeader hdr;
		memset(&hdr, 0, sizeof(hdr));
		uint32 size = dlen > sizeof(hdr) ? sizeof(hdr) : dlen;
		ZDecoder<BPTHAProxyHeader> hadec(data, size);
		res = hadec.decode(hdr);
		if(res > 0) {
			snprintf(this->m_peer_ip, sizeof(this->m_peer_ip)-1, "%u.%u.%u.%u",
					 hdr.hahdr.v2.addr.ip4.src_addr >> 24,
					 (hdr.hahdr.v2.addr.ip4.src_addr >> 16) &0x00FF,
					 (hdr.hahdr.v2.addr.ip4.src_addr & 0xFF00) >> 8,
					 hdr.hahdr.v2.addr.ip4.src_addr & 0xFF
					 );
			this->m_peer_port = hdr.hahdr.v2.addr.ip4.src_port;

			ZDEBUG("HAProxy client addrinfo:%p,%llu,srcip:%u.%u.%u.%u,dstip:%u.%u.%u.%u,srcport:%u,dstport:%u",\
				   this,id(),\
				   hdr.hahdr.v2.addr.ip4.src_addr >> 24, (hdr.hahdr.v2.addr.ip4.src_addr >> 16) &0x00FF, \
				   (hdr.hahdr.v2.addr.ip4.src_addr & 0xFF00) >> 8, hdr.hahdr.v2.addr.ip4.src_addr & 0xFF,\
				   hdr.hahdr.v2.addr.ip4.dst_addr >> 24, (hdr.hahdr.v2.addr.ip4.dst_addr >> 16) &0x00FF, \
				   (hdr.hahdr.v2.addr.ip4.dst_addr & 0xFF00) >> 8, hdr.hahdr.v2.addr.ip4.dst_addr & 0xFF,\
				   hdr.hahdr.v2.addr.ip4.src_port,\
				   hdr.hahdr.v2.addr.ip4.dst_port\
				  );
		} else if (0 == res) {
			ZDEBUG("HAProxy to be continue:%p,%llu", this,id());
		}
	}
	if(-1 == res) {//843 flash policy
		const std::string policy = "<policy-file-request/>";
		const std::string FLASH_POLICY = "<cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>";
		std::string req_policy(data, dlen-1);
		if(dlen == policy.size()+1 && 0 == ZStringTool::compare(req_policy, policy)) {
			sendCmd(FLASH_POLICY.data(), FLASH_POLICY.length());
			ZTRACE("policy send over dlen:%d, task:%p bev:%p", dlen, this, m_bev);
			destroy();
			//res = dlen;
			//ZDELX(this);
		}
	}
	return res;
}

void AccessTask::onRead(struct bufferevent *bev, void *arg) {
	AccessTask* at = (AccessTask*)arg;
	CheckConditionVoid(at && (at->m_bev == bev));
	struct evbuffer *input = bufferevent_get_input(bev);
	size_t len = evbuffer_get_length(input);
	while(len >= BPT_PACKET_HEADER_LENGTH) {
		if(!utility::bitset::is(at->m_flags, AccessTask::FlagsType_HeadPacket)) {
			char data[BPT_MAX_PACKET_LENGTH];
			uint32 dlen = len > sizeof(data) ? sizeof(data) : len;
			evbuffer_copyout(input, data, dlen);
			int32 res = at->handleHeadPacket(data, dlen);
			if(res > 0) {
				evbuffer_drain(input, res);
				len = evbuffer_get_length(input);
				utility::bitset::set(at->m_flags, AccessTask::FlagsType_HeadPacket);
				continue;
			} else if(res == 0) {
				break;
			}
			utility::bitset::set(at->m_flags, AccessTask::FlagsType_HeadPacket);
		}
		if(!utility::bitset::is(at->m_flags, AccessTask::FlagsType_BPTPacket) &&
		   !utility::bitset::is(at->m_flags, AccessTask::FlagsType_ICPacket)) {
			char magic[4];
			memset(magic, 0, sizeof(magic));
			evbuffer_copyout(input, magic, sizeof(magic)-1);
			if(!strncasecmp(magic, "BPT", sizeof("BPT")-1)) {
				utility::bitset::set(at->m_flags, AccessTask::FlagsType_BPTPacket);
			} else if(!strncasecmp(magic, "IC", sizeof("IC")-1)) {
				utility::bitset::set(at->m_flags, AccessTask::FlagsType_ICPacket);
			} else {
				// 目前 policy 843策略走到这里
				ZTRACE("no proper protocol, fd:%d, uid:%lld, at:%p", at->m_fd, at->m_id, at);
				if (at->m_fd >0)
					ZDEL(at);
				break;
			}
		}
		if(utility::bitset::is(at->m_flags, AccessTask::FlagsType_BPTPacket)) {
			BPTExternalHeader h;
			evbuffer_copyout(input, &h, sizeof(h));
			ZDecoder<BPTExternalHeader> dec((char*)&h, sizeof(h));
			CheckConditionVoid(dec.decode(h));
			CheckConditionVoid(len >= h.allSize());
			//strncpy(magic, h.magic, sizeof(h.magic));
			//(void)magic;

			char srcpackbuf[BPT_MAX_PACKET_LENGTH];
			BPTExternalHeader *head = (BPTExternalHeader*)srcpackbuf;

			evbuffer_copyout(input, head, h.allSize());

			evbuffer_drain(input, h.allSize());
			if(h.maincmd & BPT_PACKET_MASK)
				AccessTaskParser::getInstance().dispatch(network::cmd::PBMainCmdID_Reserse, 0, at, head, h.allSize());
			else {
				//do null msg
				AccessTaskParser::getInstance().dispatch(h.maincmd, h.subcmd, at, head->data, h.dataSize());
			}
			len = evbuffer_get_length(input);
			ZDEBUG("onRead %llu,%u,%u,%u,%u,%d,%d,%lu", at->id(), h.headlen, h.bodylen, h.maincmd, h.subcmd, h.cipherverion, h.version, len);
		} else if(utility::bitset::is(at->m_flags, AccessTask::FlagsType_ICPacket)) {
			ICExternalHeader h;
			evbuffer_copyout(input, &h, sizeof(h));
			ZDEBUG("onRead %llu,%u,%u,%u,%u,%d,%u", at->id(), h.cmd, h.ver,h.subver,h.bodylen, h.checksum, h.sequence);
			//ZDecoder<ICExternalHeader> dec((char*)&h, sizeof(h));
			//CheckConditionVoid(dec.decode(h));
			CheckConditionVoid(len >= h.allSize());

			char srcpackbuf[BPT_MAX_PACKET_LENGTH];
			ICExternalHeader *head = (ICExternalHeader*)srcpackbuf;

			evbuffer_copyout(input, head, h.allSize());
			evbuffer_drain(input, h.allSize());

			len = evbuffer_get_length(input);

			NETInputPacket inputPacket;
			inputPacket.Copy(head, h.allSize());
			int32 ret = CrevasseBuffer(&inputPacket);
			if(ret < 0) {
				ZERROR("checksum error, disconnect, at:%p", at);
				ZDEL(at);
				break;
			}
			at->onPong();
			AccessTaskParser::getInstance().dispatch(network::cmd::PBMainCmdID_OldTexas, 0, at, head, h.allSize());
		}
	}
}

void AccessTask::onWrite(struct bufferevent *bev, void *arg) {
	AccessTask* at = (AccessTask*)arg;
	CheckConditionVoid(at && (at->m_bev == bev));
	ZDEBUG("onWrite: %p ,%llu,%d,%p", at, at->id(), at->handle(), at->m_bev);
	if(-1 == at->m_fd) {
		ZERROR("need to recycle.%p, id:%llu, handle:%d, m_bev:%p", at, at->id(), at->handle(), at->m_bev);
		ZDEL(at);
	}
}

void AccessTask::onError(struct bufferevent *bev, int16 error, void *arg) {
	AccessTask* at = (AccessTask*)arg;
	CheckConditionVoid(at && (at->m_bev == bev));
	ZTRACE("onError: %p ,%llu,%d,%d,%p", at, at->id(), at->handle(), error, at->m_bev);
	if (error & BEV_EVENT_EOF) {
		ZTRACE("Logout from server OK BEV_EVENT_EOF");
	} else if (error & BEV_EVENT_ERROR) {
		ZERROR("Logout from server ERROR BEV_EVENT_ERROR");
		/* check errno to see what error occurred */
	} else if (error & BEV_EVENT_TIMEOUT) {
		ZERROR("Logout BEV_EVENT_TIMEOUT ERROR BEV_EVENT_TIMEOUT");
		//ZDEBUG("BEV_EVENT_TIMEOUT");
		//bufferevent_enable(bev, EV_READ);
	}
	ZDEL(at);
}

bool AccessTask::sendCmd(const void* data, const uint16 dlen) {
	if (!m_bev)
	{
		ZERROR("error m_bev:%p is null", m_bev);
		return false;
	}
	struct evbuffer *output = bufferevent_get_output(m_bev);
	CheckCondition(output, false);
	//ZDEBUG("sendCmd:%p,%u,%llu,%d,%p", this, dlen, id(), handle(), m_bev);
	return -1 != evbuffer_add(output, data, dlen);
}

bool AccessTask::sendEncodedPbCmdToMe(const uint16 maincmd, const uint64 subcmd, ::google::protobuf::Message &pb) {
	SerializeMsgMacro(pb);
	ZEncoder<BPTExternalHeader> enc;
	CheckCondition(enc.encode(maincmd, subcmd, pb__, pb_size__), false);
	return sendCmd(enc.data(), enc.length());
}

bool AccessTask::sendEncodedCmdToMe(const uint16 maincmd, const uint64 subcmd, const void *data, const uint16 dlen) {
	ZEncoder<BPTExternalHeader> enc;
	CheckCondition(enc.encode(maincmd, subcmd, data, dlen), false);
	return sendCmd(enc.data(), enc.length());
}

bool AccessTask::init() {
	m_bev = AccessServer::getInstance().getMainEvent().bvsocket(handle(), onRead, onWrite, onError, this);
	CheckCondition(m_bev, false);
	m_loginid = m_id;
	setHandle();
	onPong();
	m_em.addLoopEvent(TimeTickEvent_OnHeartBeat, 40*1000, onPing, this);//每40秒检查一次
	ZTRACE("init AccessTask success:[%p,%llu,%d,%p]", this, id(), handle(), m_bev);
	return true;
}

uint64 AccessTask::loginid() {
	return m_loginid;
}

const uint16 AccessTask::getShadowSrvId(const uint16 srvid) {
	static const uint16 mod = 0x8000;
	return (srvid & mod) ? (srvid & (~mod)) : (mod | srvid);
}
const uint32 AccessTask::parserICSrvId(const uint16 sid){
	const uint16 shadow_srvid = getShadowSrvId(sid);
	const uint32 srv_sid = (network::cmd::PBMainCmdID_OldTexas << 16) + sid;
	const uint32 srv_shadow_sid = (network::cmd::PBMainCmdID_OldTexas << 16) + shadow_srvid;
	AccessInterTask* s = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(srv_sid);
	AccessInterTask* ss = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(srv_shadow_sid);
	uint32 current_srvid = 0;
	if (s && !ss) {
		if (s->getVersion().compare(s->getLatestVersion()) >= 0)
			current_srvid = srv_sid;
		else
			current_srvid = 0;
	}
	else if (!s && ss) {
		if (ss->getVersion().compare(ss->getLatestVersion()) >= 0)
			current_srvid = srv_shadow_sid;
		else
			current_srvid = 0;
	}
	else if (s && ss) {
		current_srvid = s->getVersion().compare(ss->getVersion()) >= 0 ? srv_sid : srv_shadow_sid;
	}
	else {
		current_srvid = 0;
	}
	return current_srvid;
}
void AccessTask::setICSrvId(const uint16 sid) {
	m_ic_srvid = parserICSrvId(sid);
}

const uint32 AccessTask::getICSrvId() {
	return (network::cmd::PBMainCmdID_OldTexas << 16) + m_ic_srvid;
}

void AccessTask::setBindUid(bool b) {
	m_isbinduid = b;
}

bool AccessTask::isBindUid() {
	return m_isbinduid;
}

void AccessTask::setClientType(const uint8 clientType){
	m_clientType = clientType;
}

const uint8 AccessTask::getClientType(){
	return m_clientType;
}
void AccessTask::setMod(uint8 mod){
	m_mod = mod;
}
void AccessTask::setProxyLoginStr(const void* data, const uint16 dlen){
	m_proxyLoginStr=std::string((const char*)data,dlen);
}

const std::string& AccessTask::getProxyLoginStr(){
	return m_proxyLoginStr;
}

void AccessTask::clearProxyLoginStr(){
	m_proxyLoginStr.clear();
}

void AccessTask::onPing(int32 fd, int16 which, void *arg) {
	AccessTask* task = (AccessTask*)arg;

	if(utility::bitset::is(task->m_flags, AccessTask::FlagsType_HeartBeat)) {
		utility::bitset::clear(task->m_flags, AccessTask::FlagsType_HeartBeat);
		//network::cmd::PBNullHeartBeatServerToClient send;
		//send.set_timestamp(ZTime::getCurrentTime());
		//task->sendEncodedPbCmdToMe(network::cmd::PBMainCmdID_Null, network::cmd::PBSubCmdID_NullHeartBeatServerToClient, send);
	} else {
		ZERROR("心跳检测失败:%llu, task:%p", task->id(), task);
		ZDEL(task);
	}
}

void AccessTask::onPong() {
	utility::bitset::set(m_flags, AccessTask::FlagsType_HeartBeat);
}

void AccessTask::onLogout() {
	ZTRACE("onLogout uid:%lld", this->m_id);
	network::inter::SharedPlayerLogout send;
	send.set_uid(id());
	send.set_mod((int32)m_mod);
	//只通知1个状态服就可以了
	AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(network::cmd::PBMainCmdID_State);
	if (ait){
		ait->sendEncodedPbCmd(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_PlayerLogout, send);
	}
}

void AccessTask::onLogin() {
	ZTRACE("onLogin uid:%lld,%s", this->m_id, peerIp());
	network::inter::SharedPlayerLogin send;
	send.set_uid(id());
	send.set_mod((int32)m_mod);
	send.set_ip(peerIp());
	//只通知1个状态服就可以了
	AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(network::cmd::PBMainCmdID_State);
	if (ait){
		ait->sendEncodedPbCmd(network::inter::ServerMainCmdID_Shared, network::inter::SharedSubCmdID_PlayerLogin, send);
	}
}

bool AccessTask::sendToLinkFromClient(const void* msg, const uint16 msglen)
{
	AccessInterTask * ait = getServiceByType(PBC::PBMainCmdID_Link);

	if (!ait) { ZERROR("no linkserver"); return false; }

	return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, this->id(), msg, msglen);
}

bool AccessTask::sendToChatFromClient(const void* msg, const uint16 msglen)
{
	AccessInterTask * ait = getServiceByType(PBC::PBMainCmdID_Chat);

	if (!ait) { ZERROR("no chatserver"); return false; }

	return ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, this->id(), msg, msglen);
}

AccessInterTask* AccessTask::getServiceByType(uint16 mainCmdId)
{
	AccessInterTask * ait = NULL;
	uint32 *service_id = 0;
	switch(mainCmdId)
	{
	case PBC::PBMainCmdID_Chat:
		{
			service_id = &m_chatId;
			break;
		}
	case PBC::PBMainCmdID_Link:
		{
			service_id = &m_linkId;
			break;
		}
	default:
		return (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(mainCmdId);
	}
	if (*service_id == 0)
	{
		ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(mainCmdId);
		if (ait)  { *service_id = ait->id(); }
	}
	else
	{
		ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskById(*service_id);
	}
	if (!ait)
	{//原来的task失效
		ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(mainCmdId);
		if (ait)  { *service_id = ait->id(); }
		else { ZERROR("no mainCmdId[%d] service", mainCmdId); }
	}
	return ait;
}
