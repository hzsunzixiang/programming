template <typename Func, typename T>
void apply (Func func_ptr, T x)
{
	func_ptr(x);
}
template <typename T> void single(T)
{
}
template <typename T> void multi(T)
{
}
// ambiguous.cpp:19:22: note:   could not resolve address from overloaded function ‘& multi<int>’
//template <typename T> void multi(T*)
//{
//}
int main()
{
	apply(&single<int>, 3); // OK
	apply(&multi<int>, 7); // ERROR: no single multi<int>
}
