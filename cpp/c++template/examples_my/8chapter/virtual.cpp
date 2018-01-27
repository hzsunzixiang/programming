


// Member function templates cannot be declared virtual. This constraint is imposed because the usual implementation
// of the virtual function call mechanism uses a fixed-size table with one entry per virtual function. However, the number
// of instantiations of a member function template is not fixed until the entire program has been translated. Hence,
// supporting virtual member function templates would require support for a whole new kind of mechanism in C++
// compilers and linkers.
// In contrast, the ordinary members of class templates can be virtual because their number is fixed when a class is
// instantiated:


template <typename T>
class Dynamic {
	public:
		virtual ~Dynamic() // OK: one destructor per instance of Dynamic<T>
		{}


		// virtual.cpp:10:4: error: templates may not be ‘virtual’
		//   virtual void copy (T2 const&)

		// ERROR: unknown number of instances of copy()
		// given an instance of Dynamic<T>
		//template <typename T2>
		//	virtual void copy (T2 const&)
		//	{}



};


int main()
{
	return 0;
}
