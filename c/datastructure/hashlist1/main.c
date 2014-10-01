#include"memory.h"
#include"log.h"
#include"hash.h"
#include"zebra.h"

/* AS path may be include some AsSegments.  */
struct aspath
{
   	/* Reference count to this aspath.  */
   /*	unsigned long refcnt;*/
   	/* Rawdata length.  */
   	int length;
	int* data;
	/* AS count.  */
	/*int count;*/
	/* Rawdata.  */
	/*caddr_t data;*/
   	/* String expression of AS path.  This string is used by vty output and AS path regular expression match.  */
	/*char *str;*/
};

/* Hash for aspath.  This is the top level structure of AS path. */
static struct aspath *
aspath_new ()
{
	struct aspath *aspath;
   	/*aspath = XMALLOC (MTYPE_AS_PATH, sizeof (struct aspath));*/
   	aspath = malloc(sizeof (struct aspath));
   	memset (aspath, 0, sizeof (struct aspath));
   	return aspath;
}
void aspath_free (struct aspath *aspath)
{
	if (!aspath)
	   	return;
  /*	if (aspath->data)
		XFREE (MTYPE_AS_SEG, aspath->data);
	if (aspath->str)
		XFREE (MTYPE_AS_STR, aspath->str);
	XFREE (MTYPE_AS_PATH, aspath);*/
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
int main()
{

	struct aspath* aspath1 = aspath_new ();
	struct aspath* aspath2 = aspath_new ();
	struct aspath *find;
	int *dt=malloc(sizeof(int));
	*dt=1000;
	aspath1->length=4;

	aspath1->data=dt;
	ashash = hash_create_size (32767, aspath_key_make, aspath_cmp);
	find = hash_get (ashash, aspath1, hash_alloc_intern);
   	if (find != aspath1)
		aspath_free (aspath1);

	return 0;

}
