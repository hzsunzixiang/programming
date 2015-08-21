struct rect {
	int llx; /* X coordinate of lower-left corner */
	int lly; /* Y coordinate of lower-left corner */
	int color; /* Coding of color */
	int width; /* Width (in pixels) */
	int height; /* Height (in pixels) */
};




struct rect rotate_left(int llx)
{
	struct rect tmp;
	tmp.llx = llx;
	tmp.lly = 0;
	tmp.color = 0;
	tmp.width = 0;
	tmp.height = 0;
	return tmp;
}
