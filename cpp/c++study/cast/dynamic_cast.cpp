



#include <typeinfo> // For std::bad_cast
#include <iostream> // For std::cout, std::err, std::endl etc.

class A {
	public:
		// Since RTTI is included in the virtual method table there should be at least one virtual function.
		virtual ~A() { };
		virtual void method() { std::cout << "Method in A was invoked" << std::endl; };
		void methodSpecificToA() { std::cout << "Method specific for A was invoked" << std::endl; };
};

class B : public A {
	public:
		virtual void method() { std::cout << "Method in B was invoked" << std::endl; };
		void methodSpecificToB() { std::cout << "Method specific for B was invoked" << std::endl; };
		virtual ~B() { };
};

void my_function(A& my_a)
{
	try {
		B& my_b = dynamic_cast<B&>(my_a); // cast will be successful only for B type objects.
		my_b.methodSpecificToB();
	}
	catch (const std::bad_cast& e) {
		std::cerr << "  Exception " << e.what() << " thrown." << std::endl;
		std::cerr << "  Object is not of type B" << std::endl;
	}
}

int main()
{
	A *arrayOfA[3];          // Array of pointers to base class (A)
	arrayOfA[0] = new B();   // Pointer to B object
	arrayOfA[1] = new B();   // Pointer to B object
	arrayOfA[2] = new A();   // Pointer to A object
	for (int i = 0; i < 3; i++) {
		my_function(*arrayOfA[i]);
		delete arrayOfA[i];  // delete object to prevent memory leak
	}

	A *tmp = new B();
	tmp->method();
	//B & my_b = dynamic_cast<B&>(*tmp); 

	std::cout<< "-----------------------" << std::endl;

	//	-----------------------
	//		Method in B was invoked
	//		Method in A was invoked
	//		Method in B was invoked
	//		Method in A was invoked
	A & my_ar = dynamic_cast<A&>(*tmp); 
	my_ar.method();

	A  my_av = dynamic_cast<A&>(*tmp); 
	my_av.method();

	A & my_a1r = reinterpret_cast<A&>(*tmp); 
	my_a1r.method();

	A  my_a1v = reinterpret_cast<A&>(*tmp); 
	my_a1v.method();

	std::cout<< "-----------------------" << std::endl;

	//B *tmpb = new A(); // invalid conversion from ‘A*’ to ‘B*’ [-fpermissive]

	// 
	// Method in B was invoked
	// Method specific for B was invoked
	
	// Method in A was invoked
	// Method specific for B was invoked

	A *tmpa = new A(); 

	B  my_b1v = reinterpret_cast<B&>(*tmpa); 
	my_b1v.method();
	my_b1v.methodSpecificToB();

	// 很危险，出现了不一致的情形 
	// 换成dynamic_cast 会失败
	B  &my_b1r = reinterpret_cast<B&>(*tmpa); 
	my_b1r.method();
	my_b1r.methodSpecificToB();

	std::cout << "over " << std::endl;
}






