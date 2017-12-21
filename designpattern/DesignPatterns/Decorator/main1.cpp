#include <iostream>
#include <string>
using namespace std;

// 抽象基类 定义实现接口, Component 
class ICoffee
{
	public:
		virtual float GetCost() = 0;
		virtual std::string GetDescription() = 0;
};
// ConcreteComponent 具体的Component对象 可以给该对象动态添加职责 

class SimpleCoffee: public ICoffee
{
	public:
		SimpleCoffee()
		{
			std::cout<<"construct SimpleCoffee"<<endl;
		}
		float GetCost()
		{
			return 10.0;
		}
		std::string GetDescription()
		{
			return "return simple coffee";
		}
		virtual ~SimpleCoffee()
		{
			std::cout<<"deconstruct SimpleCoffee"<<endl;
		}
};

// Decorator 装饰抽象类 同样继承自 ICoffee
class CoffeePlus: public ICoffee
{
	public:
		//CoffeePlus(){}  //  error: uninitialized reference member in ‘class ICoffee&’ [-fpermissive]
		CoffeePlus(ICoffee &coffeeValue): coffee(coffeeValue)
		{
			std::cout<<"construct CoffeePlus"<<endl;
		}
		~CoffeePlus()
		{
			std::cout<<"deconstruct CoffeePlus"<<endl;
		}

	protected:
		ICoffee & coffee;   // 保存具体对象 可以是任何
};
// 具体的装饰对象 起到 给Component添加职责的功能
class VanillaCoffee: public CoffeePlus
{
	public:
		VanillaCoffee(ICoffee& coffeeValue): CoffeePlus(coffeeValue)
		{
		std::cout<<"construct VanillaCoffee"<<endl;
		}
		float GetCost()
		{
			return coffee.GetCost() +5;
		}
		std::string GetDescription()
		{
			return coffee.GetDescription() + " +vanilla,";
		}
		~VanillaCoffee()
		{
			std::cout<<"deconstruct VanillaCoffee"<<endl;
		}

};

// 具体的装饰对象 起到 给Component添加职责的功能
class WhipCoffee: public CoffeePlus
{
	public:
		WhipCoffee(ICoffee& coffeeValue): CoffeePlus(coffeeValue)
		{
		std::cout<<"construct whipCoffee"<<endl;
		}
		float GetCost()
		{
			return coffee.GetCost() +5;
		}
		std::string GetDescription()
		{
			return coffee.GetDescription() + " +whip,";
		}
		~WhipCoffee()
		{
			std::cout<<"deconstruct whipCoffee"<<endl;
		}

};
// 具体的装饰对象 起到 给Component添加职责的功能
class MilkCoffee: public CoffeePlus
{
	public:
		MilkCoffee(ICoffee& coffeeValue): CoffeePlus(coffeeValue)
		{
		std::cout<<"construct MilkCoffee"<<endl;
		}
		float GetCost()
		{
			return coffee.GetCost() +3;
		}
		std::string GetDescription()
		{
			return coffee.GetDescription() + " +milk,";
		}
		~MilkCoffee()
		{
			std::cout<<"deconstruct MilkCoffee"<<endl;
		}

};
int main()
{
	SimpleCoffee * coffee = new SimpleCoffee() ;
	cout << coffee->GetCost() <<endl;
	cout << coffee->GetDescription() <<endl;

	MilkCoffee *milk = new MilkCoffee(*coffee);
	cout << milk->GetCost() <<endl;
	cout << milk->GetDescription() <<endl;

	//WhipCoffee *whip = new WhipCoffee(*coffee);
	//cout << whip->GetCost() <<endl;
	//cout << whip->GetDescription() <<endl;

	WhipCoffee *whip = new WhipCoffee(*milk);
	cout << whip->GetCost() <<endl;
	cout << whip->GetDescription() <<endl;

	VanillaCoffee *vanilla= new VanillaCoffee(*milk);
	cout << vanilla->GetCost() <<endl;
	cout << vanilla->GetDescription() <<endl;

	VanillaCoffee *vanilla1= new VanillaCoffee(*whip);
	cout << vanilla->GetCost() <<endl;
	cout << vanilla->GetDescription() <<endl;
	delete coffee;
	delete milk;
	delete whip;
	delete vanilla;

	return 0;
}
