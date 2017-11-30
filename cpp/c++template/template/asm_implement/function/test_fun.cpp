


template<typename T>
T hello(T a) {
	return a + 1;
}



int main()
{
	int a = 1;
	short b = 1;
	unsigned char c  = 3;

	hello(a);
	hello(b);
	hello(c);
}

// 为每个 函数 生成一个函数模板
//	call	_Z5helloIiET_S0_
//	call	_Z5helloIsET_S0_
//	call	_Z5helloIhET_S0_
