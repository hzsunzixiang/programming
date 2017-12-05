#pragma once
#include "boost/unordered_map.hpp"

#include "z_type.h"
#include "z_memcheck.h"
#include "z_noncopyable.h"
#include "z_uniqueid.h"

class ZEntry {
public:
	ZEntry() : m_id(0) {bzero(m_name, sizeof(m_name)); bzero(m_aliasname, sizeof(m_aliasname));}
	virtual ~ZEntry(){}
	uint64 id() {return m_id;}
	void setId(const uint64 id) {m_id = id;}
	void setName(const char* name) {strncpy(m_name, name, sizeof(m_name)-1);}
	const int8* name() const {return m_name;}
	void setAliasName(const char* name) {strncpy(m_aliasname, name, sizeof(m_aliasname)-1);}
	const int8* aliasname() {return m_aliasname;}
	virtual const char* getClassName() const = 0;
protected:
	uint64 m_id;    //  这是ZEntry 的唯一标识 初始化 为 0
	int8 m_name[MAX_NAMESIZE];
	int8 m_aliasname[MAX_NAMESIZE];
};

template <typename T, typename RTValue = bool>
struct ZCallback     {
	virtual RTValue exec(T *e)=0;
	virtual void notify(T *e, uint64 event) {}
	virtual ~ZCallback(){};
};

template <class keyT, class valueT>
class ZLimitHash : private ZNonCopyable {
public:
	typedef boost::unordered_map<keyT, valueT> HashMap;
	typedef typename HashMap::iterator hashmap_iter;
	typedef typename HashMap::const_iterator const_iter;

protected:
	HashMap m_ets;

	bool insert(const keyT &key, valueT &value) {
		return m_ets.insert(std::make_pair(key, value)).second;
	}

	bool find(const keyT &key, valueT &value) const {
		const_iter it = m_ets.find(key);
		if(it != m_ets.end()) {
			value = it->second;
			return true;
		}
		else {
			return false;
		}
	}

	ZLimitHash(){}

	virtual ~ZLimitHash() {
		clear();
	}

	void remove(const keyT &key) {
		m_ets.erase(key);
	}

	void clear() {
		m_ets.clear();
	}

	size_t size() const {
		return m_ets.size();
	}

	bool empty() const {
		return m_ets.empty();
	}
};

class ZIndexID : public ZLimitHash<uint64, ZEntry*> {
protected:
	bool push(ZEntry* &e) {
		ZEntry *temp;
		if(!this->find(e->id(), temp))
			return insert(e->id(), e);
		else
			return false;
	}

	void remove(ZEntry* e) {
		if(e) ZLimitHash<uint64, ZEntry*>::remove(e->id());
	}

	ZEntry * getEntryByID(const uint64 id) const {
		ZEntry *ret = NULL;
		this->find(id, ret);
		return ret;
	}
};

template<typename T = UniqueDWORDID>
class IndexTempID : public ZLimitHash<uint64, ZEntry*>, public T {
protected:
	IndexTempID(uint64 start) : T(start) {}
	~IndexTempID(){}

protected:
	bool push(ZEntry* e) {
		uint64 id = e->id();   // 这里保证插入的唯一性 以当前ZEntry 的id来查找
		if(e && T::getUniqueID(id)) {
			ZEntry *temp;
			if(!find(id, temp)) {
				if(insert(id, e)) {
					e->setId(id);
					return true;
				}
			}
			T::putUniqueID(id); // 如果已经相应条目 或者插入失败  则放入回收队列
		}
		return false;
	}

	void remove(ZEntry* e) {
		if(e) {
			uint64 id = e->id();
			ZLimitHash<uint64, ZEntry*>::remove(e->id());
			e->setId(0);
			T::putUniqueID(id);  // 放入回收队列
		}
	}

	ZEntry* getEntryByID(const uint64 id) const {
		ZEntry* ret = NULL;
		ZLimitHash<uint64, ZEntry*>::find(id, ret);
		return ret;
	}
};

typedef IndexTempID<UniqueDWORDID> IndexTempID_DWORD;

class ZIndexName : public ZLimitHash<const char*, ZEntry*> {
protected:
	bool push(ZEntry* &e) {
		ZEntry* temp;
		if(!find(e->name(), temp))
			return insert(e->name(), e);
		else
			return false;
	}

	void remove(ZEntry* e) {
		if(e != NULL) {
			ZLimitHash<const char*, ZEntry*>::remove(e->name());
		}
	}

	ZEntry* getEntryByName(const char* name) const {
		ZEntry* ret = NULL;
		ZLimitHash<const char*, ZEntry*>::find(name, ret);
		return ret;
	}

	ZEntry* getEntryByName(const std::string &name) const {
		return getEntryByName(name.c_str());
	}
};

class ZIndexSTDName : public ZLimitHash<std::string, ZEntry*> {
protected:
	bool push(ZEntry* &e) {
		ZEntry* temp;
		if (!find(e->name(), temp))
			return insert(e->name(), e);
		else
			return false;
	}

	void remove(ZEntry* e) {
		if (e != NULL) {
			ZLimitHash<std::string, ZEntry*>::remove(e->name());
		}
	}

	ZEntry* getEntryByName(const char* name) const {
		ZEntry* ret = NULL;
		ZLimitHash<std::string, ZEntry*>::find(name, ret);
		return ret;
	}

	ZEntry* getEntryByName(const std::string &name) const {
		return getEntryByName(name.c_str());
	}
};

template<int i>
class IndexNone : public ZLimitHash<const char*, ZEntry*> {
protected:
	bool push(ZEntry* &e){return true;}
	void remove(ZEntry* &e){}
	void clear(){}
};

template<typename e1 = IndexNone<1>, typename e2 = IndexNone<2>, typename e3 = IndexNone<3> >
class ZEntryManager : protected e1, protected e2, protected e3
{
public:
	size_t size() const {
		return e1::size();
	}

	bool empty() const {
		return e1::empty();
	}
protected:
	bool addEntry(ZEntry* e) {
		if(e1::push(e)) {
			if(e2::push(e)) {
				if(e3::push(e)) {
					return true;
				}
				else {
					e2::remove(e);
					e1::remove(e);
				}
			}
			else {
				e1::remove(e);
			}
		}
		return false;
	}
	void removeEntry(ZEntry* e) {
		e1::remove(e);
		e2::remove(e);
		e3::remove(e);
	}

	ZEntryManager(){}
	~ZEntryManager(){}

	void clear() {
		e1::clear();
		e2::clear();
		e3::clear();
	}

	template <class YourEntry>
		bool execEveryEntry(ZCallback<YourEntry> &eee) {
			typename e1::hashmap_iter iter_temp;
			for(typename e1::hashmap_iter it = e1::m_ets.begin(); it != e1::m_ets.end();) {
				iter_temp = it;
				++it;
				if(!eee.exec((YourEntry *)iter_temp->second))
					return false;
			}
			return true;
		}

	void destroy() {
		typename e1::hashmap_iter iter_temp;
		for(typename e1::hashmap_iter it = e1::m_ets.begin(); it != e1::m_ets.end(); ++it) {
			ZEntry* e = (ZEntry*)it->second;
			ZDEL(e);
		}
	}
};
