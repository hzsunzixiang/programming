int gotodiff(int x, int y) {
	if (x >= y)
		goto x_ge_y;
	return y - x;
x_ge_y:
	return  x - y;
}
