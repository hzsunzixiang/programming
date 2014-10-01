
#include "zebra.h"

#include "linklist.h"
#include "memory.h"
int main ()
{
		list l;
		listnode n;
		char *kuni = "kuni";
		char *mio = "mio";

		l = list_new ();
		listnode_add(l, kuni);
		listnode_add (l, mio);
		for (n = l->head; n; nextnode (n))
		{
				printf ("%s\n", getdata(n));
		}
		printf("\nlookup\n");
		n = listnode_lookup (l, mio);

		printf("n:%s\n",n->data);
		printf("\ndelete\n");
		listnode_delete (l, n);
		for (n = l->head; n; nextnode (n))
		{
				printf ("%s\n", getdata(n));
		}
		printf("l->count%d\n",l->count);
		printf("\nlookup2\n");

		n = listnode_lookup (l, kuni);

		printf("n:%s\n",n->data);
		printf("\ndelete2\n");
		listnode_delete (l, n);
		for (n = l->head; n; nextnode (n))
		{
				printf ("%s\n", getdata(n));
		}
		printf("l->count%d\n",l->count);
		if (list_isempty (l))
				list_delete (l);
		printf("\nfree\n");
		printf("l->count%d\n",l->count);
		for (n = l->head; n; nextnode (n))
		{
				printf ("%s\n", getdata(n));
		}
		return 0;
}
