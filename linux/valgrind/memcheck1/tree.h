#ifndef __BADLEAK__ 
#define __BADLEAK__ 

typedef struct __node { 
	struct __node *l; 
	struct __node *r; 
	char v; 
}node; 

 

node *mk(node *l , node *r , char val); 

void nodefr(node *n); 

#endif 
