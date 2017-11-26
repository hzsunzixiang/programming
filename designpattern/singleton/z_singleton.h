#pragma once
#include <assert.h>

#include "z_type.h"
#include "z_memcheck.h"
#include "z_noncopyable.h"

#include <iostream>
using namespace std;

template <typename T, bool INIT = true>
class ZSingleton : private ZNonCopyable {
};

template <typename T>
class ZSingleton<T,true> : private ZNonCopyable {
protected:
	ZSingleton() 
	{
		cout << "ZSingleton init" << endl;
	}
	~ZSingleton() 
	{
		cout << "ZSingleton destroy" << endl;
	}

public:
	static T& getInstance() {
		assert(m_instance);
		return *m_instance;
	}

	static void newInstance() {
		ZDEL(m_instance);
		m_instance = ZNEW T();
	}

	static void delInstance() {
		ZDEL(m_instance);
	}

protected:
	static T* m_instance;
};

template <typename T>
class ZSingleton<T,false> : private ZNonCopyable {
protected:
	ZSingleton(){}
	~ZSingleton(){}

public:
	static T& getInstance() {
		assert(m_instance);
		return *m_instance;
	}

	template <typename T1>
		static T1& getInstance() {
			assert(m_instance);
			return *(T1*)m_instance;
		}

	template < typename T1>
		static T1& newInstance() {
			ZDEL(m_instance);
			m_instance = ZNEW T1();
			return *(T1*)m_instance;
		}

	static void delInstance() {
		ZDEL(m_instance);
	}

protected:
	static T* m_instance;
};

template <typename T > T* ZSingleton<T , true>::m_instance = ZNEW T();
template <typename T> T* ZSingleton<T , false>::m_instance = NULL;
