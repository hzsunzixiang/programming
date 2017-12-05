#pragma once
#include <netinet/tcp.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <signal.h>
#include <stdio.h>
#include <cstddef>
#include <time.h>
#include <strings.h>
#include <unistd.h>
#include <stdlib.h>
#include <limits.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <string>
#include <deque>

#include "External/clog/log.h"


typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef signed short int16;
typedef unsigned short uint16;
typedef int int32;
typedef signed int int32;
typedef unsigned int uint32;
typedef unsigned long long uint64;
typedef long long int64;
typedef float  float32;
typedef double float64;

typedef int64 TUID;
typedef int64 TMONEY;

static const uint32 MAX_INTERFACE_LENGTH = 128;
static const uint32 MAX_NAMESIZE = 64;
static const uint32 CHUNK_ALIGN_BYTES = 8;
static const uint32 MAX_ENDPOIN_LENGTH = 64;
static const uint32 MAX_SOCKET_RCVBUF_LENGTH = 128 * 1024;
static const uint32 MAX_SOCKET_SNDBUF_LENGTH = 128 * 1024;
static const uint32 MAX_HTTP_TIMEOUT = 10;
static const uint32 MAX_HTTP_REREYS = 3;
static const uint32 MAX_HTTP_BODY_SIZE = 1024*64;
static const uint32 MAX_HTTP_HEAD_SIZE = 1024*64;

#ifndef BOOST_SYSTEM_NO_DEPRECATED
#define BOOST_SYSTEM_NO_DEPRECATED 1
#endif

#ifndef ArrayNum
#define ArrayNum(x) (sizeof(x)/sizeof(x[0]))
#endif

#ifndef CheckCondition
#define CheckCondition(c, ret) \
	do {\
		if(!(c)) return ret;\
	}while(0)
#endif

#ifndef CheckConditionVoid
#define CheckConditionVoid(c) \
	do {\
		if(!(c)) return;\
	}while(0)
#endif

#ifndef LogCheckCondition
#define LogCheckCondition(c, ret, msg, ...) \
	do {\
		if(!(c)) { ZERROR(msg, ##__VA_ARGS__); return ret;}\
	}while(0)
#endif

#ifndef LogCheckConditionVoid
#define LogCheckConditionVoid(c, msg, ...) \
	do {\
		if(!(c)) { ZERROR(msg, ##__VA_ARGS__); return;}\
	}while(0)
#endif


#ifndef ContinueCondition
#define ContinueCondition(c) \
	if(!(c)) continue;
#endif

struct TLinkID
{
	TLinkID() { S_un.id = 0; }
	TLinkID(uint64 id) { S_un.id = id; }

	TLinkID & operator=(const TLinkID &rhv)	{
		this->S_un.id = rhv.S_un.id;
		return *this;
	}

	TLinkID & operator=(const uint64 &rhv) {
		this->S_un.id = rhv;
		return *this;
	}

	union {
		uint64 id;
		struct { uint16 dsid, dtype, ssid, stype; } split;
		struct { uint32 dstid, srvid;} peer;
	} S_un;
};

#define p_id S_un.id
#define p_stype S_un.split.stype
#define p_ssid S_un.split.ssid
#define p_dtype S_un.split.dtype
#define p_dsid S_un.split.dsid

#define p_srvid S_un.peer.srvid
#define p_dstid S_un.peer.dstid

struct TChipsKey
{
	TChipsKey() { S_un.id = 0; }
	TChipsKey(int64 id) { S_un.id = id; }

	TChipsKey & operator=(const TChipsKey &rhv)	{
		this->S_un.id = rhv.S_un.id;
		return *this;
	}

	TChipsKey & operator=(const int64 &rhv) {
		this->S_un.id = rhv;
		return *this;
	}
	union {
		int64 id;
		struct { int32 svrID, tid;} split;
	} S_un;
};

#ifndef GetSourceServerId
#define GetSourceServerId(l) (l >> 32)
#endif

#ifndef GetDestinationServerId
#define GetDestinationServerId(l) (l & 0xFFFFFFFF)
#endif

#ifndef GetServerType
#define GetServerType(s) (s >> 16)
#endif

#ifndef GetServerId
#define GetServerId(s) (s & 0xFFFF)
#endif

#define p_svrid S_un.svrID
#define p_tid S_un.tid
