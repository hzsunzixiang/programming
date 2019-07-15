#include <stdio.h>
#include <string>
#include "common.h"
#include "base64.h"
#include "curl_api.h"

using namespace std;

int main()
{
	int itimeout = 10;
	// 单位ms
	curl_api::curl_set_timeout_ms(itimeout*1000, itimeout*1000);

	struct curl_api::curl_request_st req;
	struct curl_api::curl_respond_st res;
	string errmsg;

	req.heads.push_back(string("Content-Type: ") + "application/x-www-form-urlencoded");
	//req.heads.push_back("Host: www.baidu.com");
	//req.data =  "helloworld";

	//string url = "https://www.baidu.com/";
	string url = "http://localhost/";
	 //if (curl_api::curl_post(url, req, res, errmsg) != 0)
	if (curl_api::curl_get(url, req, res, errmsg) != 0)
	{
		printf("post curl_post fail, errmsg: %s", errmsg.c_str());
		//throw WEBEXCEPT(ERROR_CALL_WX_HTTP, string("call http failed"));
	}
	printf("res.data:%s", res.data.c_str());
	return 0;
}
