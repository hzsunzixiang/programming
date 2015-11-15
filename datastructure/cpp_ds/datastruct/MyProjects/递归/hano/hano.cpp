
#include <iostream> 
#include <stdlib.h> 

#ifdef _WIN32 
using namespace std; 
#endif 

static void hanoi(int height) 
{ 
    int fromPole, toPole, Disk; 
    int *BitStr = new int[height], 
        *Hold   = new int[height]; 
    char Place[]  = {'A', 'C', 'B'}; 
    int i, j, temp; 
  
    for (i=0; i < height; i++) 
    { 
        BitStr[i] = 0; 
        Hold[i] = 1; 
    } 
    temp = 3 - (height % 2); 
    int TotalMoves = (1 << height) - 1; 
    for (i=1; i <= TotalMoves; i++) 
    { 
        for (j=0 ; BitStr[j] != 0; j++) 
        { 
            BitStr[j] = 0; 
        } 
        BitStr[j] = 1; 
        Disk = j+1; 
        if (Disk == 1) 
        { 
            fromPole = Hold[0]; 
            toPole = 6 - fromPole - temp; 
            temp = fromPole; 
        } 
        else 
        { 
            fromPole = Hold[Disk-1]; 
            toPole = 6 - Hold[0] - Hold[Disk-1]; 
        }        
        cout << "Move disk " << Disk << " from " << Place[fromPole-1] 
             << " to " << Place[toPole-1] << endl; 
        Hold[Disk-1] = toPole; 
    } 
} 




int main(int argc, char *argv[]) 
{ 
    cout << "Towers of Hanoi: " << endl 
         << "moving a tower of n disks from pole A to pole B by using pole C" << endl; 
    cout << "Input the height of the original tower: "; 
    int height; 
    cin >> height; 
    hanoi(height); 

    system("PAUSE"); 
    return EXIT_SUCCESS; 
} 
