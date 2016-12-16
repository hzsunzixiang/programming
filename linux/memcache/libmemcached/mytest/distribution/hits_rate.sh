
FILE_RES=res_file.txt


for ((; ;))
do
    :>$FILE_RES
    result=`for ((i = 11211; i < 11216; i++))
    do
        echo "stats" | nc 127.0.0.1  11211 -q1 |grep -e cmd_get -e get_hits  >>  $FILE_RES
    done`
    cat $FILE_RES |
    awk '
    {   if($2=="cmd_get") total+=$3;
        if($2=="get_hits") hits+=$3;
    }
    END {
        if(total>0)
            printf("%s  %lf\n", strftime("%T",systime()), hits/(total+0.0));
        else
            printf("%s  %lf\n", strftime("%T",systime()), 1);
    }'
    sleep 1
done

#STAT cmd_get 0
#STAT get_hits 0

#data=() #declare an array outside the scope of loop
#idx=0   #initialize a counter to zero
#for i in {53..99} #some random number range
#do
#    data[idx]=`printf "number=%s\n" $i` #store data in array
#    idx=$((idx+1)) #increment the counter
#done
#echo ${data[*]} #your result
