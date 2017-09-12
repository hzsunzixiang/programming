#include "Framework/z_task.h"
#include "Framework/z_type.h"
#include "Framework/z_event_manager.h"

class AccessInterTask;
namespace google {namespace protobuf{struct Message;}}

enum LoginEnumMod {
	LOGIN_MOD_NORMAL  = 0,
	LOGIN_MOD_RELOGIN = 1,
};
enum LogoutEnumMod {
	LOGOUT_MOD_NORMAL  = 0,
	LOGOUT_MOD_RELOGIN = 1,
};

class AccessTask : public ZTask {
private:
	enum FlagsType {
		FlagsType_None				= 0,
		FlagsType_HeadPacket		= 1,
		FlagsType_HeartBeat			= 2,
		FlagsType_BPTPacket			= 3,
		FlagsType_ICPacket			= 4,
		FlagsType_Max,
	};

public:
	AccessTask(const int32 nfd);
	~AccessTask();
	struct bufferevent *getBev() {return m_bev;}

	void destroy();
	bool init();
	const char* getClassName() {return "AccessTask";}
	static void onRead(struct bufferevent *bev, void *arg);
	static void onWrite(struct bufferevent *bev, void *arg);
	static void onError(struct bufferevent *bev, int16 error, void *arg);
	bool sendCmd(const void* data, const uint16 dlen);
	bool sendEncodedPbCmdToMe(const uint16 maincmd, const uint64 subcmd, ::google::protobuf::Message &pb);
	bool sendEncodedCmdToMe(const uint16 maincmd, const uint64 subcmd, const void *data, const uint16 dlen);
	uint64 loginid();
	void setBindUid(bool b=true);
	bool isBindUid();
	void onPong();
	static const uint16 getShadowSrvId(const uint16 srvid);
	void setICSrvId(const uint16 sid);
	const uint32 getICSrvId();
	const uint32 parserICSrvId(const uint16 sid);
	int32 handleHeadPacket(const char* data, const uint16 dlen);
	static void onPing(int32 fd, int16 which, void *arg);
	void setClientType(const uint8 clientType);
	const uint8 getClientType();
	void setProxyLoginStr(const void* data, const uint16 dlen);
	const std::string& getProxyLoginStr();
	void clearProxyLoginStr();
	void setMod(uint8 mod);

public://add by jim
	void onLogout();
	void onLogin();
	bool sendToLinkFromClient(const void* msg, const uint16 msglen);
	bool sendToChatFromClient(const void* msg, const uint16 msglen);
	AccessInterTask* getServiceByType(uint16 mainCmdId);

private:
	std::string m_proxyLoginStr;
	struct bufferevent *m_bev;
	uint64 m_loginid;
	uint16 m_ic_srvid;
	bool m_isbinduid;
	ZEventManager m_em;
	uint8 m_flags[FlagsType_Max/8+1];

	uint32 m_linkId;
	uint32 m_chatId;
	uint8 m_clientType;//1:pc端,2:移动端
	uint8 m_mod;//0：正常，1：重复登录
};
