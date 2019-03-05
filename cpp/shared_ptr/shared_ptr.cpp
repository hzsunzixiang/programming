#include<iostream>
#include<memory>

struct Sample
{
	void dummyFunction()
	{
		std::cout << "dummyFunction" << std::endl;
	}
};

int main()
{

	std::shared_ptr<Sample> ptr = std::make_shared<Sample>();

	(*ptr).dummyFunction(); // Will Work

	ptr->dummyFunction(); // Will Work

	// ptr[0]->dummyFunction(); // This line will not compile.
	// ptr++;  // This line will not compile.
	//ptr--;  // This line will not compile.

	std::shared_ptr<Sample> ptr2(ptr);

	if (ptr == ptr2) // Will work
		std::cout << "ptr and ptr2 are equal" << std::endl;


	// https://stackoverflow.com/questions/20895648/difference-in-make-shared-and-normal-shared-ptr-in-c
	// 
	auto p1(std::make_shared<Sample>());

	return 0;
}



