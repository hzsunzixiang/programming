for i in  1 2 3 4 5 6 100
do
	openssl rand -out xx.$i.txt -rand rand.man -hex $i
done
