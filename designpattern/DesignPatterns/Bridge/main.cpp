#include <iostream>
#include <string>

using namespace std;
// 主题和其具体实现 

// 抽象实现类 AbstractionImpl
// 如果要调用其实现 必须包含其头文件 这里是先看到其定义
class ITheme
{
	public:
		virtual int GetColor()=0;

};

class DarkTheme: public ITheme
{
	public:
		DarkTheme() {}
		int GetColor()
		{
			return 11;
		}
		~DarkTheme() {}
};

class LightTheme: public ITheme
{
	public:
		LightTheme() {}
		int GetColor()
		{
			return 22;
		}
		~LightTheme() {}
};

class AquaTheme: public ITheme
{
	public:
		AquaTheme() {}
		int GetColor()
		{
			return 33;
		}
		~AquaTheme() {}
};



// Abstraction

class IWebPage
{
	public:
		virtual void GetContent() = 0;
};


class About: public IWebPage
{
	public:
		About(ITheme *impl) : impl_(impl)
		{
		}
		void GetContent()
		{
			cout << "the About implement:" << impl_->GetColor() <<endl;
		}
		~About()
		{
		}

	private:
		ITheme *impl_;
};

class Careers: public IWebPage
{
	public:
		Careers(ITheme *impl) : impl_(impl)
	{

	}
		void GetContent()
		{
			cout << "the Careers implement:" << impl_->GetColor() <<endl;
		}
		~Careers()
		{
		}

	private:
		ITheme *impl_;
};


int main()
{
	ITheme *dark = new DarkTheme();
	ITheme *light = new LightTheme();
	ITheme *aqua= new AquaTheme();

	IWebPage *about = new About(dark);
	about->GetContent();

	about = new About(light);
	about->GetContent();

	about = new About(aqua);
	about->GetContent();

	IWebPage *career  = new Careers(dark);
	career->GetContent();

	career = new Careers(light);
	career->GetContent();

	career = new Careers(aqua);
	career->GetContent();



	return 0;

}






