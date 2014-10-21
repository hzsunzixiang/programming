/* Hash routine.
sunzixiang.  */

#ifndef MY_HASH_H
#define MY_HASH_H

/* Default hash table size.  */ 
#define HASHTABSIZE     1024

struct hash_bucket
{
  /* Linked list.  */
  struct hash_bucket *next;

  /* Hash key. */
  unsigned int key;

  /* Data.  */
  void *data;
};

struct hash
{
  /* Hash bucket. */
  struct hash_bucket **index;

  /* Hash table size. */
  unsigned int size;

  /* Key make function. */
  unsigned int (*hash_key) ();

  /* Data compare function. */
  int (*hash_cmp) ();

  /* Backet alloc. */
  unsigned long count;
};

struct hash *hash_create (unsigned int (*) (), int (*) ());
struct hash *hash_create_size (unsigned int, unsigned int (*) (), int (*) ());

void *hash_get (struct hash *, void *, void * (*) ());
void *hash_alloc_intern (void *);
void *hash_lookup (struct hash *, void *);
void *hash_release (struct hash *, void *);

void hash_iterate (struct hash *, 
		   void (*) (struct hash_bucket *, void *), void *);

void hash_clean (struct hash *, void (*) (void *));
void hash_free (struct hash *);

#endif /* MY_HASH_H */
