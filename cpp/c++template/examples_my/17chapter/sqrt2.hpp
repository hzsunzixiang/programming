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
#include "ifthenelse.hpp"

// 记住， 可以把IfThenElse看成一个建议装置(实际上是模板), 它能根据给定布尔常量的值，
// 在两个类型中选择其中一个. 如果布尔常量为真的话，那么将会把第一个类型typedef为ResultT;
// 否则, ResultT将代表第二个类型
// 还有一点我们要清楚的是: 为一个类模板实例化定一个一个typedef并不会导致c++ 编译器实例化该实例的实体。也就是说当我们编写
//
//    typedef typename IfThenElse<(N<mid*mid), Sqrt<N,LO,mid-1>, Sqrt<N,mid,HI> >::ResultT SubT;
// 的时候， Sqrt<N,LO,mid-1> Sqrt<N,mid,HI>  都不会被完全实例。
// 事实上，SubT最后只能代表其中一个类型, 而且只有在查找SubT::result的时候，才会被完全实例化SubT所代表的类型。

// Remember, the IfThenElse template is a device that selects between two types based on a given Boolean constant.
// If the constant is true, the first type is typedefed to ResultT; otherwise, ResultT stands for the second type. At this
// point it is important to remember that defining a typedef for a class template instance does not cause a C++ compiler
// to instantiate the body of that instance. Therefore, when we write
// typedef typename IfThenElse<(N<mid*mid),  Sqrt<N,LO,mid-1>,  Sqrt<N,mid,HI> >::ResultT  SubT;

// neither Sqrt<N,LO,mid-1> nor Sqrt<N,mid,HI> is fully instantiated. Whichever of these two types ends up being a
// synonym for SubT is fully instantiated when looking up SubT::result. In contrast to our first approach, this strategy
// leads to a number of instantiations that is proportional to log2(N): a very significant reduction in the cost of
// metaprogramming when N gets moderately large.



// primary template for main recursive step
template<int N, int LO=1, int HI=N>
class Sqrt {
  public:
    // compute the midpoint, rounded up
    enum { mid = (LO+HI+1)/2 };

    // search a not too large value in a halved interval
    typedef typename IfThenElse<(N<mid*mid), Sqrt<N,LO,mid-1>, Sqrt<N,mid,HI> >::ResultT SubT;
    enum { result = SubT::result };
};

// partial specialization for end of recursion criterion
template<int N, int S>
class Sqrt<N, S, S> {
  public:
    enum { result = S };
};

// // partial specialization: true yields second argument
// template<typename Ta, typename Tb>
// class IfThenElse<true, Ta, Tb> {
//   public:
//     typedef Ta ResultT;
// };
// 
// // partial specialization: false yields third argument
// template<typename Ta, typename Tb>
// class IfThenElse<false, Ta, Tb> {
//   public:
//     typedef Tb ResultT;
// };
