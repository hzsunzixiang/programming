#include <iostream>

//class IInterviewer
//    askQuestions() = 0;
//
//class Developer : public IInterviewer
//
//class CommunityExecutive : public IInterviewer
//
//class HiringManager
//        IInterviewer* interviewer = this->makeInterviewer();
//        interviewer->askQuestions();
//
//protected:
//    virtual IInterviewer* makeInterviewer() = 0;

using namespace std;
// Product
// 面试官
class IInterviewer
{
	public:
		virtual void askQuestions() = 0;
};


// ConcreteProduct1
class Developer: public IInterviewer
{
	public:
		virtual void askQuestions()
		{
			cout << "ask c++ " <<endl;
		}
};

// ConcreteProduct2
class CommunityExecutive: public IInterviewer
{
	public:
		virtual void askQuestions()
		{
			cout << "ask manager " <<endl;
		}

};


// Factory
class HiringManager
{
	public:
		void takeInterview()
		{
			IInterviewer *interviewer = this->makeInterviewer();
			interviewer->askQuestions();
		}
	protected:
		virtual IInterviewer* makeInterviewer() = 0;
};

template <typename InterViewer>
class Mangager : public HiringManager
{
	protected:
		virtual IInterviewer* makeInterviewer()
		{
			return new InterViewer();
		}
};


// 定义创建对象的接口 
// 将实际创建工作延迟到子类

int main()
{
	HiringManager  *dev = new Mangager<Developer>();
	dev->takeInterview();

	HiringManager *com= new Mangager<CommunityExecutive>();
	com->takeInterview();
	return 0;
}



