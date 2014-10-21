#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include"hash.h"


/* the data to be hashed*/
struct aspath;
struct aspath
{
		int length;
		int* data;
};
/* Hash for aspath.  */
static struct aspath *aspath_new ();
void aspath_free (struct aspath *aspath);
unsigned int  aspath_key_make (struct aspath *aspath);
/* If two aspath have same value then return 1 else return 0 */
int aspath_cmp (struct aspath *as1, struct aspath *as2);

struct hash *ashash;

int main()
{

		struct aspath* aspath1 = aspath_new ();
		struct aspath* aspath2 = aspath_new ();
		struct aspath *find;
		int *dt=malloc(sizeof(int));
		int *dt2=malloc(sizeof(int));
		*dt=1000;
		*dt2=2000;
		aspath1->length=4;
		aspath1->data=dt;

		aspath2->length=8;
		aspath2->data=dt2;
		ashash = hash_create_size (32767, aspath_key_make, aspath_cmp);
		find = hash_get (ashash, aspath1, hash_alloc_intern);
		if(find != NULL ){
			printf("\nfind the value find->length\t%d,*(find->data)\t%d\n", find->length, *(find->data));
		}

		find = hash_get (ashash, aspath1, hash_alloc_intern);
		find = hash_get (ashash, aspath2, NULL);
		if(find != NULL ){
			printf("\nfind the value find->length\t%d,find->data\t%d\n", find->length, *(find->data));
		}
		else
		{
			printf("\ncannot find the value aspath2->length\t%d,aspath2->data\t%d\n",aspath2->length, *(aspath2->data));
		}
		find = hash_get (ashash, aspath2, hash_alloc_intern);
		if(find != NULL ){
			printf("\nfind the value find->length\t%d,*find->data\t%d\n", find->length, *(find->data));
		}
		else
		{
			printf("\ncannot find the value aspath2->length\t%d,aspath2->data\t%d\n",aspath2->length, *(aspath2->data));
		}

		if (find != aspath1)
				aspath_free (aspath1);
		return 0;
}
/* AS path may be include some AsSegments.  */

/* Hash for aspath. */
		static struct aspath *
aspath_new ()
{
		struct aspath *aspath;
		aspath = malloc(sizeof (struct aspath));
		memset (aspath, 0, sizeof (struct aspath));
		return aspath;
}
void aspath_free (struct aspath *aspath)
{
		if (!aspath)
				return;
		if(aspath->data)
				free(aspath->data);
		free(aspath);
}

		unsigned int
aspath_key_make (struct aspath *aspath)
{
		unsigned int key = 0;
		int length;
		unsigned int* pnt;
		length = aspath->length / 2;
		pnt = (unsigned int *) aspath->data;
		while (length)
		{
				key += *pnt++;
				length--;
		}
		return key;
}
/* If two aspath have same value then return 1 else return 0 */
		int
aspath_cmp (struct aspath *as1, struct aspath *as2)
{
		if (as1->length == as2->length
						&& !memcmp (as1->data, as2->data, as1->length))
				return 1;
		else
				return 0;
}

struct hash *ashash;
