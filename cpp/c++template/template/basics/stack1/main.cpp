

int main()
{
    try {
        throw 222222;
    }
    catch (int x) {
        return 333333;  // exit program with ERROR status
    }
	return 0;
}
// #include <iostream>
// #include <string>
// #include <cstdlib>
// #include <stdexcept>
// 
// int main()
// {
//     try {
//         throw std::out_of_range("Stack<>::pop(): empty stack");
//     }
//     catch (std::exception const& ex) {
//         std::cerr << "Exception: " << ex.what() << std::endl;
//         return EXIT_FAILURE;  // exit program with ERROR status
//     }
// 
// 	return EXIT_SUCCESS;
// }
