#include "access_httpserver.h"
#include "access_server.h"
#include "access_config_manager.h"

static void onWebJS(int32 fd, int16 which, void *arg) {
	struct evhttp_request *req = (struct evhttp_request *)arg;

	const char* uri = evhttp_request_get_uri(req);
	struct evhttp_uri * u = evhttp_uri_parse_with_flags(uri, 0);
	const char* path = evhttp_uri_get_path(u);
	const char* query = evhttp_uri_get_query(u);

	ZDEBUG("%s,%s", path+(sizeof("/ajax/")-1), query);

	//test case
	//evhttp_add_header(evhttp_request_get_output_headers(req), "Content-Type", "application/x-javascript;charset=utf-8");
	evhttp_add_header(evhttp_request_get_output_headers(req), "Content-Type", "text/html;charset=utf-8");
	struct evbuffer *buf = evbuffer_new();

	//FILE* fp = fopen("./202.html", "r");
	//fseek(fp, 0L, SEEK_END);
	//long sz = ftell(fp);
	//fseek(fp, 0, SEEK_SET);
	//evbuffer_add_file(buf, fileno(fp), 0, sz);

	std::string js = "{\"tableIndex\":{\"delaytime\":1200,\"flag\":720998,\"mid\":13,\"name\":\"常规猎人赛\",\"tid\":0,\"time\":1492425000}}";
	evbuffer_add_printf(buf, "%s", js.c_str());
	evhttp_send_reply(req, HTTP_OK, "OK", buf);
	evbuffer_free(buf);
	//
}

static void webJS(struct evhttp_request *req, void *arg) {
	ZDEBUG("webJS:%p", req);

	//simulate asynchronization by timer
	struct timeval tv;
	tv.tv_sec= 0;
	tv.tv_usec = 200000;
	m_main_event.registry(-1, 0, onWebJS, req, &tv);
	//TODO:transfor to lua(php) by rpc api
}

bool AccessHttpServer::init(const char* addr, const uint16 port) {
	CheckCondition(ZHttpServer::init(AccessServer::getInstance().getMainEvent().base(), addr, port), false);

	struct RegistryAllJsWebModuleCallback : public ZCallback<std::string> {
		ZHttpServer* m_s;
		RegistryAllJsWebModuleCallback(ZHttpServer* s) : m_s(s){}
		bool exec(std::string* e) {
			if(!m_s->registry(e->c_str(), webJS, NULL)) {
				ZERROR("注册失败:%s",e->c_str());
				return false;
			}
			return true;
		}
	}cb(this);
	AccessConfigManager::getInstance().execEveryWebJs(cb);
	return true;
}
