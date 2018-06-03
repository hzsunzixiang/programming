

for i in `seq 1 7`
do
    for j in `seq 1 7`
	do
		echo $i,$j, `./gf_mult $i $j 3`
	done
done

