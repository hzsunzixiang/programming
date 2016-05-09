/* printf example */
#include <stdio.h>
#include <unistd.h>

int main()
{
	//setvbuf(stdout, NULL, _IONBF, 0);
	printf ("Characters: %c %c ", 'a', 65);

	printf ("sizeof(struct _IO_FILE): %ld", sizeof(struct _IO_FILE));
	// sizeof(struct _IO_FILE): 216

	pause();

	return 0;
}

extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;

//struct _IO_FILE {
//  int _flags;
//  char* _IO_read_ptr;
//  char* _IO_read_end;
//  char* _IO_read_base;
//  char* _IO_write_base;
//  char* _IO_write_ptr;
//  char* _IO_write_end;
//  char* _IO_buf_base;
//  char* _IO_buf_end;
//  char *_IO_save_base;
//  char *_IO_backup_base;
//  char *_IO_save_end;
//  struct _IO_marker *_markers;
//  struct _IO_FILE *_chain;
//  int _fileno;
//  int _flags2;
//  __off_t _old_offset;
//  unsigned short _cur_column;
//  signed char _vtable_offset;
//  char _shortbuf[1];
//  _IO_lock_t *_lock;
//  __off64_t _offset;
//  void *__pad1;
//  void *__pad2;
//  void *__pad3;
//  void *__pad4;
//  size_t __pad5;
//  int _mode;
//  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
//};
