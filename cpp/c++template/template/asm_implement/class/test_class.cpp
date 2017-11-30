

template <class Type> class calc
{
	public:
		Type multiply(Type x, Type y);
		Type add(Type x, Type y);
};
template <class Type> Type calc<Type>::multiply(Type x,Type y)
{
	return x*y;
}
template <class Type> Type calc<Type>::add(Type x, Type y)
{
	return x+y;
}


int main()
{
	calc <int> int_calc_class;
	calc <double> double_calc_class;

	int_calc_class.add(2, 3);
	double_calc_class.add(2.0, 3.0);

}
// 某个类的 某个函数
// i integer ; d double
//	call	_ZN4calcIiE3addEii
//	call	_ZN4calcIdE3addEdd
