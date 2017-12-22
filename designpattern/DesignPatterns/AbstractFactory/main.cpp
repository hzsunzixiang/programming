#include <iostream>

// class IDoor {
// class WoodenDoor : public IDoor {
// 
// class IronDoor : public IDoor {
// class IDoorFittingExpert {
// class Carpenter : public IDoorFittingExpert {
// class Welder : public IDoorFittingExpert {
// class IDoorFactory {
//     IDoor* MakeDoor() override {
//     IDoorFittingExpert* MakeFittingExpert() override {


// 提供一个创建一系列相关或相互依赖对象的接口 而无需指定他们具体的类

//AbstractProductA
class IDoor
{
	public:
		virtual void GetDescription() = 0;
};

// Prodcut A1
class WoodenDoor : public IDoor
{
	public:
		void GetDescription()
		{
			std::cout << "I am a wooden door" << std::endl;
		}

};
// Product A2
class IronDoor : public IDoor
{
	public:
		void GetDescription()
		{
			std::cout << "I am a iron door" << std::endl;
		}
};


// AbstractProductB
class IDoorFittingExpert
{
	public:
		virtual void GetDescription() = 0;
};

// Prodcut B1 
class  Carpenter: public IDoorFittingExpert
{
    void GetDescription() {
        std::cout << "I can only fit wooden doors" << std::endl;
    }
};
// Prodcut B2
class Welder : public IDoorFittingExpert {
    void GetDescription() {
        std::cout << "I can only fit iron doors" << std::endl;
    }
};

// 提供一个创建一系列相关或相互依赖对象的接口 而无需指定他们具体的类
// AbstractFactory
class IDoorFactory {
public:
    virtual IDoor* MakeDoor() = 0;
    virtual IDoorFittingExpert* MakeFittingExpert() = 0;
};

//模板定义 各种 ConcreteFactory


template<typename Door, typename Expert>
class  DoorFactory : public IDoorFactory
{
	public:
		IDoor* MakeDoor()
		{
			return new Door();
		}

		IDoorFittingExpert* MakeFittingExpert()
		{
			return new Expert();
		}
};


int main()
{
	IDoorFactory * A = new DoorFactory<WoodenDoor, Carpenter>();
	{
		IDoor* door = A->MakeDoor();
		door->GetDescription();
		IDoorFittingExpert * expert = A->MakeFittingExpert();
		expert->GetDescription();
	}
	IDoorFactory * B = new DoorFactory<IronDoor, Welder>();
	{
		IDoor* door = B->MakeDoor();
		door->GetDescription();
		IDoorFittingExpert * expert = B->MakeFittingExpert();
		expert->GetDescription();
	}
	return 0;
}










