#include "External/jsoncpp/json/json.h"

#include "GameLib/icpack/TexasPacket.h"
#include "GameLib/icpack/TexasPacketHandle.h"

#include "Framework/z_encoder.h"
#include "Framework/z_decoder.h"

#include "Cmd/cmd.pb.h"
#include "Cmd/utils.h"

#include "access_httpclient.h"
#include "access_server.h"
#include "access_task.h"
#include "access_task_manager.h"
#include "access_intertask.h"
#include "access_intertask_manager.h"
#include "access_httpclient_parser.h"
#include "access_config_manager.h"

AccessHttpClient::AccessHttpClient(AccessTask *task) : m_client_fid(0) {
	m_taskid = task->id();
}

AccessHttpClient::~AccessHttpClient() {
	clear();
	//ZDEBUG("关闭HTTP请求");
}

void AccessHttpClient::clear() {
	m_taskid = 0;
}

bool AccessHttpClient::sendCmd(const void* data, const uint16 dlen) {
	struct evbuffer *output = evhttp_request_get_output_buffer(m_req);
	CheckCondition(output, false);
	return -1 != evbuffer_add(output, data, dlen);
}

void AccessHttpClient::httpHandle(struct evhttp_request *req, void *arg) {
	AccessHttpClient* at = (AccessHttpClient*)arg;
	CheckConditionVoid(at->m_req == req);
	AccessTask* task = at->task();
	int retcode = evhttp_request_get_response_code(req);
	if(HTTP_OK != retcode) {
		ZERROR("Http Request:%p,%llu,%d", task, at->m_taskid, retcode);
		ZDEL(at);
		return;
	}

	struct evbuffer *input = evhttp_request_get_input_buffer(req);
	size_t len = evbuffer_get_length(input);
	char magic[4] = {0};
	while(len >= BPT_PACKET_HEADER_LENGTH) {
		BPTExternalHeader h;
		evbuffer_copyout(input, &h, sizeof(h));
		ZDecoder<BPTExternalHeader> dec((char*)&h, sizeof(h));
		CheckConditionVoid(dec.decode(h));
		CheckConditionVoid(len >= h.allSize());
		strncpy(magic, h.magic, sizeof(h.magic));

		char srcpackbuf[BPT_MAX_PACKET_LENGTH] = {0};
		BPTExternalHeader *head = (BPTExternalHeader*)srcpackbuf;

		evbuffer_copyout(input, head, h.allSize());

		evbuffer_drain(input, h.allSize());
		if(task && AccessConfigManager::getInstance().isPHPMsg(h.maincmd)) {
			task->sendCmd(head, h.allSize());
		}
		//AccessHttpClientParser::getInstance().dispatch(h.maincmd, 0, at, head, h.allSize());
		len = evbuffer_get_length(input);
		ZDEBUG("Http onRead %p,%llu,%s,%u,%u,%u,%u,%d,%d,%lu", task, at->m_taskid, magic, h.headlen, h.bodylen, h.maincmd, h.subcmd, h.cipherverion, h.version, len);
	}
	ZDEBUG("Http onRead %p,%llu,%d,%lu", task, at->m_taskid, retcode, len);

	ZDEL(at);
}

bool AccessHttpClient::req(const char* uri, AccessTask *t, const void *data, const int32 dlen) {
	AccessHttpClient *ht = ZNEW AccessHttpClient(t);
	CheckCondition(ht, false);

	if(!ht->request(t->peerIp(), uri, httpHandle, ht, data, dlen)) {
		ZERROR("请求HTTP失败:%llu,%p", ht->m_taskid, ht);
		ZDEL(ht);
		return false;
	}
	//ZDEBUG("创建HTTP请求");

	return true;
}

void AccessHttpClient::httpOldTexasHandle(struct evhttp_request *req, void *arg) {
	AccessHttpClient* at = (AccessHttpClient*)arg;
	CheckConditionVoid(at->m_req == req);
	AccessTask* task = at->task();
	int retcode = evhttp_request_get_response_code(req);
	if(HTTP_OK != retcode) {
		ZERROR("Http Request:%p,%llu,%d", task, at->m_taskid, retcode);
		ZDEL(at);
		return;
	}

	struct evbuffer *input = evhttp_request_get_input_buffer(req);
	size_t len = evbuffer_get_length(input);
	char srcpackbuf[BPT_MAX_PACKET_LENGTH];
	//evbuffer_copyout(input, srcpackbuf, len);
	evbuffer_remove(input, srcpackbuf, len);
	uint8 loginstr_len = 0;
	if (at->m_islogin){
		uint32 mid, sessionid;
		char head[7]={0}, mtkey[33]={0};
		memcpy(head, srcpackbuf, 6);
		memcpy(&mid, srcpackbuf + 6, 4);
		memcpy(&sessionid, srcpackbuf + 10, 4);
		memcpy(mtkey, srcpackbuf + 14,32);
		mid=htonl(mid);
		sessionid=htonl(sessionid);
		const std::string head_target="login:";
		ZTRACE("mblogin-1,%s,%s,%u,%u,%s", head_target.c_str(), head, mid, sessionid, mtkey);
		if (strcmp(head_target.c_str(),head)==0){
			loginstr_len = 46;
			if (mid > 0 && sessionid > 0){
				AccessInterTask * ait = (AccessInterTask*)AccessInterTaskManager::getInstance().getTaskByType(network::cmd::PBMainCmdID_State);
				task->setClientType(2);//设置为移动
				NETOutputPacket sendPacket_auth;
				if (ait) {
					ZEncoder<BPTExternalHeader> enc;
					sendPacket_auth.Begin(0x0501);
					sendPacket_auth.WriteInt(mid);
					sendPacket_auth.WriteString(mtkey);
					sendPacket_auth.WriteInt(sessionid);
					sendPacket_auth.WriteByte(2);
					sendPacket_auth.End();
					EncryptBuffer(&sendPacket_auth);
					enc.encode(network::cmd::PBMainCmdID_State, network::cmd::PBStateSubCmdID_LoginOldTexasState, sendPacket_auth.packet_buf(), sendPacket_auth.packet_size());
					ait->sendEncodedCmd(network::inter::ServerCmdType_Client, 0, 0, task->id(), enc.data(), enc.length());
				}else {
					ZERROR("notify client no available service");
					sendPacket_auth.Begin(0x0514);
					sendPacket_auth.End();
					EncryptBuffer(&sendPacket_auth);
					task->sendCmd(sendPacket_auth.packet_buf(), sendPacket_auth.packet_size());
				}
			}			
		}
	}
	NETOutputPacket sendPacket;
	sendPacket.Begin(0x0200);
	sendPacket.WriteInt(at->m_client_fid);
	sendPacket.WriteInt(retcode);
	sendPacket.WriteBinary(srcpackbuf+loginstr_len, len-loginstr_len);
	sendPacket.End();
	EncryptBuffer(&sendPacket);
	if(task)
		task->sendCmd(sendPacket.packet_buf(), sendPacket.packet_size());


	ZDEBUG("Http onRead %u,%p,%llu,%d,%lu", at->m_client_fid, task, at->m_taskid, retcode, len);

	ZDEL(at);
}

bool AccessHttpClient::reqOldTexas(const bool islogin, const uint8 clitype, const uint32 seq, AccessTask *t, const std::string& head, const std::string& content) {
	const char *uri=NULL;
	Json::Reader reader;
	Json::Value value;
	if (reader.parse(head, value) && value.isMember("CCGATE-AC")) {
		uri = AccessConfigManager::getInstance().get_http_acturl();
	} else {
		if(1 == clitype) {
			uri = AccessConfigManager::getInstance().get_http_pcurl();
		} else{
			uri = AccessConfigManager::getInstance().get_http_mburl();
		}
	}
	AccessHttpClient *ht = ZNEW AccessHttpClient(t);
	CheckCondition(ht, false);
	ht->m_client_fid = seq;
	ht->m_islogin = islogin;

	struct evhttp_uri *xuri = evhttp_uri_parse(uri);
	if(!xuri) {
		ZDEL(ht);
		return false;
	}
	const char* host = evhttp_uri_get_host(xuri);
	if(!host) {
		ZDEL(ht);
		return false;
	}
	int32 port = evhttp_uri_get_port(xuri);
	port = -1 == port ? 80 : port;

	struct evhttp_connection* conn = evhttp_connection_base_new(m_main_event.base(), NULL, host, port);
	if(!conn) {
		ZDEL(ht);
		evhttp_uri_free(xuri);
		return false;
	}
	evhttp_connection_set_timeout(conn, MAX_HTTP_TIMEOUT);
	evhttp_connection_set_retries(conn, MAX_HTTP_REREYS);
	evhttp_connection_set_max_body_size(conn, MAX_HTTP_BODY_SIZE);
	evhttp_connection_set_max_headers_size(conn, MAX_HTTP_HEAD_SIZE);

	ht->m_req = evhttp_request_new(AccessHttpClient::httpOldTexasHandle, ht);
	if(!ht->m_req) {
		ZDEL(ht);
		evhttp_uri_free(xuri);
		evhttp_request_free(ht->m_req);
		return false;
	}
	evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "HOST", AccessConfigManager::getInstance().get_http_host());

	std::string clitype_str, mid;
	ZStringTool::format(clitype_str, "%u", clitype);
	ZStringTool::format(mid, "%llu", t->id());
	struct evbuffer *evout = evhttp_request_get_output_buffer(ht->m_req);
	evbuffer_add(evout, content.data(), content.size());

	const std::vector<std::string> member = value.getMemberNames();
	std::vector<std::string>::const_iterator iter = member.begin();
	for (; iter != member.end(); iter++)
	{
		evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), iter->c_str(), value[*iter].asString().c_str());
	}
	evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "Content-Type", "application/x-www-form-urlencoded");
	evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "X-FORWARDED-FOR", t->peerIp());
	evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "Connection", "Keep-Alive");
	evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "CCGATE", clitype_str.c_str());
	if (islogin){
		evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "CCGATE-LOGIN", "2");
		evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "CC-MID", "0");
	}else{
		evhttp_add_header(evhttp_request_get_output_headers(ht->m_req), "CC-MID", mid.c_str());
	}
	evhttp_make_request(conn, ht->m_req, EVHTTP_REQ_POST, evhttp_uri_get_path(xuri));
	evhttp_uri_free(xuri);
	return true;
}

AccessTask* AccessHttpClient::task() {
	AccessTask *t = (AccessTask*)AccessTaskManager::getInstance().getTaskById(m_taskid);
	return t ? t : (AccessTask*)AccessTaskVerifyManager::getInstance().getTaskById(m_taskid);
}
