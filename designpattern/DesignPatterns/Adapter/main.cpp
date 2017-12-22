#include <iostream>

// class ILion {
//     virtual void Roar() {
// class Hunter {
// 
// class WildDog
//     void Bark() {
// class WildDogAdapter 
// 
// int main()
// {
// }

using namespace std;

// 简便起见  有的省略了西沟函数  注意析构函数必须得写 而且是虚函数
// target   需要适配成的接口
// ILion - > Roar  // 客户所期待的接口 目标可以是具体的或抽象的类 也可以是接口
class ILion
{
	public:
		virtual void Roar()
		{
			cout << "i am a lion" << endl;
		}
};

// Adaptee 需要适配的类 接口
class WildDog
{
	public:
		virtual void Bark() // SpecificRequest
		{
			cout << "dog bark" <<endl;
		}
		virtual ~WildDog(){}
};

// Adapter 
// 在内部包装一个Adaptee 对象
class WildDogAdapter: public ILion
{
	public:
		WildDogAdapter(WildDog *dog)
		{
			dog_ = dog;
		}
		void Roar()
		{
			if (dog_)
			{
				cout << "i am a dog" <<endl;
				dog_->Bark();
			}
		}
		~WildDogAdapter(){}
	private:
		WildDog * dog_;
};

// 类模式适配器 
// 通过public接口 获得接口继承效果
// 通过private 继承 Adaptee 获得实现继承效果
class WildDogAdapter1: public ILion, private WildDog
{
	public:
		WildDogAdapter1()
		{
		}
		void Roar()
		{
			cout << "i am a dog in class" <<endl;
			Bark();
		}
		~WildDogAdapter1(){}
};
int main()
{
	WildDog *dog = new WildDog();
	WildDogAdapter * wilddogAdapter = new WildDogAdapter(dog);
	wilddogAdapter->Roar();

	WildDogAdapter1* wildClass = new WildDogAdapter1();	
	wildClass->Roar();

	delete dog;
	delete wilddogAdapter; 
	delete wildClass;
	return 0;
}




