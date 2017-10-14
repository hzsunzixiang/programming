#! /bin/sh
awk '{
	if ($1 == 10) {
		getline < "foo.input"
	    print
	} else
		print
}' line2
