/*
 * Memory management routine
 * Copyright (C) 1998 Kunihiro Ishiguro
 *
 * This file is part of GNU Zebra.
 *
 * GNU Zebra is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2, or (at your option) any
 * later version.
 *
 * GNU Zebra is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GNU Zebra; see the file COPYING.  If not, write to the Free
 * Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.  
 */

#include "zebra.h"

#include "log.h"
#include "memory.h"

void alloc_inc (int);
void alloc_dec (int);
struct message mstr [] =
{
		{ MTYPE_THREAD, "thread" },
		{ MTYPE_THREAD_MASTER, "thread_master" },
		{ MTYPE_VECTOR, "vector" },
		{ MTYPE_VECTOR_INDEX, "vector_index" },
		{ MTYPE_IF, "interface" },
		{ 0, NULL },
};

/* Fatal memory allocation error occured. */
		static void
zerror (const char *fname, int type, size_t size)
{
		fprintf (stderr, "%s : can't allocate memory for `%s' size %d\n", 
						fname, lookup (mstr, type), (int) size);
		exit (1);
}

/* Memory allocation. */
		void *
zmalloc (int type, size_t size)
{
		void *memory;

		memory = malloc (size);

		if (memory == NULL)
				zerror ("malloc", type, size);

		alloc_inc (type);

		return memory;
}

/* Memory allocation with num * size with cleared. */
		void *
zcalloc (int type, size_t size)
{
		void *memory;

		memory = calloc (1, size);

		if (memory == NULL)
				zerror ("calloc", type, size);

		alloc_inc (type);

		return memory;
}

/* Memory reallocation. */
		void *
zrealloc (int type, void *ptr, size_t size)
{
		void *memory;

		memory = realloc (ptr, size);
		if (memory == NULL)
				zerror ("realloc", type, size);
		return memory;
}

/* Memory free. */
		void
zfree (int type, void *ptr)
{
		alloc_dec (type);
		free (ptr);
}

/* String duplication. */
		char *
zstrdup (int type, char *str)
{
		void *dup;

		dup = strdup (str);
		if (dup == NULL)
				zerror ("strdup", type, strlen (str));
		alloc_inc (type);
		return dup;
}

#ifdef MEMORY_LOG
struct 
{
		char *name;
		unsigned long alloc;
		unsigned long t_malloc;
		unsigned long c_malloc;
		unsigned long t_calloc;
		unsigned long c_calloc;
		unsigned long t_realloc;
		unsigned long t_free;
		unsigned long c_strdup;
} mstat [MTYPE_MAX];

		void
mtype_log (char *func, void *memory, const char *file, int line, int type)
{
		zlog_info ("%s: %s %p %s %d", func, lookup (mstr, type), memory, file, line);
}

		void *
mtype_zmalloc (const char *file, int line, int type, size_t size)
{
		void *memory;

		mstat[type].c_malloc++;
		mstat[type].t_malloc++;

		memory = zmalloc (type, size);
		mtype_log ("zmalloc", memory, file, line, type);

		return memory;
}

		void *
mtype_zcalloc (const char *file, int line, int type, size_t size)
{
		void *memory;

		mstat[type].c_calloc++;
		mstat[type].t_calloc++;

		memory = zcalloc (type, size);
		mtype_log ("xcalloc", memory, file, line, type);

		return memory;
}

		void *
mtype_zrealloc (const char *file, int line, int type, void *ptr, size_t size)
{
		void *memory;

		/* Realloc need before allocated pointer. */
		mstat[type].t_realloc++;

		memory = zrealloc (type, ptr, size);

		mtype_log ("xrealloc", memory, file, line, type);

		return memory;
}

/* Important function. */
		void 
mtype_zfree (const char *file, int line, int type, void *ptr)
{
		mstat[type].t_free++;

		mtype_log ("xfree", ptr, file, line, type);

		zfree (type, ptr);
}

		char *
mtype_zstrdup (const char *file, int line, int type, char *str)
{
		char *memory;

		mstat[type].c_strdup++;

		memory = zstrdup (type, str);

		mtype_log ("xstrdup", memory, file, line, type);

		return memory;
}
#else
struct 
{
		char *name;
		unsigned long alloc;
} mstat [MTYPE_MAX];
#endif /* MTPYE_LOG */

/* Increment allocation counter. */
		void
alloc_inc (int type)
{
		mstat[type].alloc++;
}

/* Decrement allocation counter. */
		void
alloc_dec (int type)
{
		mstat[type].alloc--;
}
