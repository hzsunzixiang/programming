
#include "z_entry.h"
#include "z_singleton.h"

#include <iostream>
using namespace std;

#define ZDEBUG printf
#define ZERROR printf

class ZTask : public ZEntry {
public:
	ZTask() {}
	~ZTask(){}
	const char* getClassName() const {return "ZTask";}
	void setHandle() {}
	int32 handle() {return m_fd;}

	void close();

protected:
	int32 m_fd;
};

class AccessTask : public ZTask {

public:
	AccessTask(const int32 nfd): m_loginid(0){}
	~AccessTask(){}
	const char* getClassName() {return "AccessTask";}
	uint64 loginid() {
		return m_loginid;
	}

	void setLoginid() {
		m_loginid = m_id;
	}

private:
	uint64 m_loginid;
};



class AccessTaskVerifyManager : public IndexTempID<>, public ZSingleton<AccessTaskVerifyManager> {
	private:
		friend class ZSingleton<AccessTaskVerifyManager>;
		AccessTaskVerifyManager() : IndexTempID<>(0x100000000){}   // 指定起始位置 4294967296
	public:
		~AccessTaskVerifyManager(){}
		bool addTask(AccessTask *t);
		void removeTask(AccessTask *t);
		AccessTask* getTaskById(const uint64 id);
};

bool AccessTaskVerifyManager::addTask(AccessTask *t) {
    return this->push((ZEntry*)t);
}

void AccessTaskVerifyManager::removeTask(AccessTask *t) {
    this->remove((ZEntry*)t);
}

AccessTask* AccessTaskVerifyManager::getTaskById(const uint64 id) {
    return (AccessTask*)this->getEntryByID(id);
}


int main()
{
	int sfd = 10;
    AccessTask *at = ZNEW AccessTask(sfd);

    ZDEBUG("the sfd is:%d, AccessTask:%p\n", sfd, at);
    if(!AccessTaskVerifyManager::getInstance().addTask(at)) {
        ZERROR("add to VerifyManager error :%p,%llu,%d\n", at,at->id(), 10);
        ZDEL(at);
    }

	at->setLoginid();
	printf("at->id:%llu, id:%lld\n", at->id(), at->loginid());
	AccessTask *newtask = AccessTaskVerifyManager::getInstance().getTaskById(at->id());

	// 此时唯一性的id已经改变 loginid不变
	printf("getTaskById:id:%llu, AccessTask:%p, loginid:%llu\n", at->id(), newtask, at->loginid());


	
	// 登录成功之后
	newtask->setId(123456);
    ZDEBUG("create connection success:%p,%llu,%d\n",at,at->id(),sfd);
	// 已经插入 再次插入失败
    if(!AccessTaskVerifyManager::getInstance().addTask(at)) {
        ZERROR("add to VerifyManager error :%p,%llu,%d\n", at,at->id(), 10);
        ZDEL(at);
    }

	return 0;
}
