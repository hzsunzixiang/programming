#pragma once

#include <list>
#include <set>
#include <stdint.h>
#include <ext/pool_allocator.h>

#include "z_type.h"

template <class T>
class ZUniqueID {
public:
	ZUniqueID() {
		initIDRange(1,(T)-1);
	}

	ZUniqueID(T startID) {
		initIDRange(startID,(T)-1);
	}

	ZUniqueID(T startID,T endID) {
		initIDRange(startID,endID);
	}

	~ZUniqueID() {
		m_idlist.clear();
	}

	T getCurMaxId()
	{
		return m_cur_max_id;
	}
protected:
	void initIDRange(T min,T max) {
		m_min_id=min;
		m_max_id=max;
		m_cur_max_id=m_min_id;
	}

public:
	// 一旦达到最大值 就要从回收列表中获取了 此时 m_cur_max_id 的值是最大值 不再发生变化
	T getUniqueID(T &id) {
		if(id != 0) return 0;
		T ret;
		if(m_max_id>m_cur_max_id) {
			ret=m_cur_max_id;
			m_cur_max_id++;
		}
		else
			ret=m_max_id;
		if(ret == m_max_id && !m_idlist.empty()) {   //从回收列别中获取  取不到最大值 最大值-1
			ret=m_idlist.back();
			m_idlist.pop_back();
			m_idset.erase(ret);
		}
		id = ret;
		return ret;
	}


	// 这个函数用来回收 不用的id
	void putUniqueID(T &id) {
		if(id<m_max_id && id>=m_min_id) {
			if(m_idset.insert(id).second) {
				m_idlist.push_front(id);
			}
		}
	}

private:
	typedef std::set<T> UniqueSet;
	typedef typename UniqueSet::iterator UniqueSet_iter;
	UniqueSet m_idset;
	typedef std::list<T, __gnu_cxx::__pool_alloc<T> > UniqueList;
	typedef typename UniqueList::iterator UniqueList_iter;
	UniqueList m_idlist;
	T m_max_id;
	T m_min_id;
	T m_cur_max_id;
};

typedef ZUniqueID<uint64> UniqueDWORDID;
