
template <typename T>
class List { // a namespace scope class template
	public:
		template <typename T2> // a member function template
			List (List<T2> const&); // (constructor)
};


template <typename T>
	template <typename T2>
List<T>::List (List<T2> const& b) // an out-of-class member function
{ // template definition
}



template <typename T>
int length (List<T> const&) // a namespace scope function template
{
	return 0;
}
class Collection {
	template <typename T> // an in-class member class template
		class Node { // definition
		};
	template <typename T> // another member class template,
			 class Handle; // without its definition

	template <typename T> // an in-class (and therefore implicitly
		T* alloc() { // inline) member function template
			// definition
		}
};
// class 关键字必须的 是为了修饰 Handle
template <typename T> // an out-of-class member class
class Collection::Handle{ // template definition
};



// 注意这里是union
template <typename T>
union AllocChunk {
	T object;
	unsigned char bytes[sizeof(T)];
};

// 缺省调用实参
template <typename T>
void report_top (List<T> const&, int number = 10)
{
}


// 缺省模板实参可以依赖于模板参数
template <typename T>
void fill (List<T>*, T const& = T()) // T() is zero for built-in types
{
}



// When the fill() function is called, the default argument is not instantiated if a second function call argument is supplied. 
// This ensures that no error is issued if the default call argument cannot be instantiated for a particular T.
class Value {
	public:
		Value(int) // no default constructor
		{}
};
void init (List<Value>* array)
{
	Value zero(0);

	fill(array, zero); // OK: = T() is not used
	//fill(array); // ERROR: = T() is used, but not valid for T = Value
}

int main()
{
	return 0;
}




