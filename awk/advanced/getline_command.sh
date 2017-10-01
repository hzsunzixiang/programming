#! /bin/sh
awk '{
	if ($1 == "@execute") {
		tmp = substr($0, 10)
		while ((tmp | getline) > 0)
			print
			close(tmp)
	} else
		print
}' execute
