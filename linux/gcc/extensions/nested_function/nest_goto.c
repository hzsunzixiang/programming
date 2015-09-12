int bar (int *array, int offset, int size)
{
	__label__ failure;
	int access (int *array, int index)
	{
		if (index > size)
			goto failure;
		return array[index + offset];
	}
	int i;
	/* ... */
	for (i = 0; i < size; i++)
		/* ... */ access (array, i); /* ... */
			/* ... */
			return 0;

	/* Control comes here from access
	   if it detects an error.  */
failure:
	return -1;
}
