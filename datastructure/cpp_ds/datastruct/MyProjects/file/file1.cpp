#include <stdlib.h>
#include <fstream.h>
void main()
{    ofstream fout("d:\\tz.txt");
     if (!fout) { //若打开文件失败
        cerr<<"File d:\\tz.txt not open"<<endl;
        exit(1);
    }
    char ch=cin.get();
    while(ch!=EOF)
     {          fout.put(ch);  ch=cin.get;      }
fout.close();
}
