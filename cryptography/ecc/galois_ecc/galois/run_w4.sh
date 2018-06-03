
for i in `seq 1 15`
do
    for j in `seq 1 15`
	do
		echo $i,$j, `./gf_mult $i $j 4`
	done
done

