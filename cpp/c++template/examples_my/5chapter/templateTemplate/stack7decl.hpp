/* The following code example is taken from the book
 * "C++ Templates - The Complete Guide"
 * by David Vandevoorde and Nicolai M. Josuttis, Addison-Wesley, 2002
 *
 * (C) Copyright David Vandevoorde and Nicolai M. Josuttis 2002.
 * Permission to copy, use, modify, sell and distribute this software
 * is granted provided this copyright notice appears in all copies.
 * This software is provided "as is" without express or implied
 * warranty, and with no claim as to its suitability for any purpose.
 */

// Template Template Argument Matching
// If you try to use the new version of Stack, you get an error message saying that the default valuset d::deque is not
// compatible with the template template parameter CONT. The problem is that a template template argument must be
// a template with parameters that exactly match the parameters of the template template parameter it substitutes.
// Default template arguments of template template arguments are not considered, so that a match cannot be achieved
// by leaving out arguments that have default values.
// The problem in this example is that the std::deque template of the standard library has more than one parameter:
// The second parameter (which describes a so-called allocator) has a default value, but this is not considered when
// matching std::deque to the CONT parameter.

// deque 有两个模板参数  和声明不匹配 所以缺省参数不能 编译通过

template <typename T,
          template <typename ELEM> class CONT = std::deque >
class Stack {
  private:
    CONT<T> elems;         // elements

  public:
    void push(T const&);   // push element
    void pop();            // pop element
    T top() const;         // return top element
    bool empty() const {   // return whether the stack is empty
        return elems.empty();
    }
};
