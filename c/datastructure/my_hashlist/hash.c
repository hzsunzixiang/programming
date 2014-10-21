/* Hash routine.
 */

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include "hash.h"

/* Allocate a new hash.  */
		struct hash *
hash_create_size (unsigned int size, 
				unsigned int (*hash_key) (), int (*hash_cmp) ())
{
		struct hash *hash;

		hash = (struct hash*)malloc (sizeof (struct hash));
		if (hash == NULL)
		{
				fprintf (stderr, "can't allocate memory for hash size %d\n", (int) size);
				exit (1);
		}


		hash->index = (struct hash_bucket**)malloc(sizeof (struct hash_bucket *) * size);
		if (hash == NULL)
		{
				fprintf (stderr, "can't allocate memory for hash_bucket size %d\n", (int) size);
				exit (1);
		}
		memset (hash->index, 0, sizeof (struct hash_bucket *) * size);
		hash->size = size;
		hash->hash_key = hash_key;
		hash->hash_cmp = hash_cmp;
		hash->count = 0;

		return hash;
}

/* Allocate a new hash with default hash size.  */
		struct hash *
hash_create (unsigned int (*hash_key) (), int (*hash_cmp) ())
{
		return hash_create_size (HASHTABSIZE, hash_key, hash_cmp);
}

/* Utility function for hash_get().  When this function is specified
   as alloc_func, return arugment as it is.  This function is used for
   intern already allocated value.  */
		void *
hash_alloc_intern (void *arg)
{
		return arg;
}

/* Lookup and return hash bucket in hash.  If there is no
   corresponding hash bucket and alloc_func is specified, create new
   hash bucket.  */
		void *
hash_get (struct hash *hash, void *data, void * (*alloc_func) ())
{
		unsigned int key;
		unsigned int index;
		void *newdata;
		struct hash_bucket *bucket;

		key = (*hash->hash_key) (data);
		index = key % hash->size;

		for (bucket = hash->index[index]; bucket != NULL; bucket = bucket->next) 
				if (bucket->key == key && (*hash->hash_cmp) (bucket->data, data))
				{
						printf("\nexist!\n");
						return bucket->data;
				}

		if (alloc_func)
		{
				newdata = (*alloc_func) (data);
				if (newdata == NULL)
				{

						printf("\ninsert a NULL pointer!\n");
						return NULL;
				}

				bucket = (struct hash_bucket*)malloc(sizeof (struct hash_bucket));
				bucket->data = newdata;
				bucket->key = key;
				bucket->next = hash->index[index];
				hash->index[index] = bucket;
				hash->count++;
				printf("\ninsert a effective pointer\n");
				return bucket->data;
		}
		printf("\nunpointing alloc_func\n");
		return NULL;
}

/* Hash lookup.  */
		void *
hash_lookup (struct hash *hash, void *data)
{
		return hash_get (hash, data, NULL);
}

/* This function release registered value from specified hash.  When
   release is successfully finished, return the data pointer in the
   hash bucket.  */
		void *
hash_release (struct hash *hash, void *data)
{
		void *ret;
		unsigned int key;
		unsigned int index;
		struct hash_bucket *bucket;
		struct hash_bucket *pp;

		key = (*hash->hash_key) (data);
		index = key % hash->size;

		for (bucket = pp = hash->index[index]; bucket; bucket = bucket->next)
		{
				if (bucket->key == key && (*hash->hash_cmp) (bucket->data, data)) 
				{
						if (bucket == pp) 
								hash->index[index] = bucket->next;
						else 
								pp->next = bucket->next;

						ret = bucket->data;
						free(bucket);
						hash->count--;
						return ret;
				}
				pp = bucket;
		}
		return NULL;
}

/* Iterator function for hash.  */
		void
hash_iterate (struct hash *hash, 
				void (*func) (struct hash_bucket *, void *), void *arg)
{
		int i;
		struct hash_bucket *hb;

		for (i = 0; i < hash->size; i++)
				for (hb = hash->index[i]; hb; hb = hb->next)
						(*func) (hb, arg);
}

/* Clean up hash.  */
		void
hash_clean (struct hash *hash, void (*free_func) (void *))
{
		int i;
		struct hash_bucket *hb;
		struct hash_bucket *next;

		for (i = 0; i < hash->size; i++)
		{
				for (hb = hash->index[i]; hb; hb = next)
				{
						next = hb->next;

						if (free_func)
								(*free_func) (hb->data);

						free(hb);
						hash->count--;
				}
				hash->index[i] = NULL;
		}
}

/* Free hash memory.  You may call hash_clean before call this
   function.  */
		void
hash_free (struct hash *hash)
{
		free(hash->index);
		free(hash);
}
