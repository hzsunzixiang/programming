#!/bin/bash

{
    echo  '=================virsh list========================='
    virsh list
    
    echo  '=================ps aux|grep qemu-kvm========================='
    ps aux|grep qemu-kvm
    
    echo  '=================process========================='
    for((;;))
    do 
    	netstat -anpt |grep -w 49152| grep -v grep
        process=`netstat -anpt |grep 49152 |grep ESTABLISHED |awk '{print $NF}' | awk -F/ '{print $1}' | head -n1`
    	if [ ! -z "$process" ]
    	then 
    	    echo "the process is" $process
    	    ps aux |grep $process |grep -v grep
    		netstat -anpt |grep $process | grep -v grep
    	fi
        echo  '=================virsh list========================='
        virsh list
        sleep .5
    done 
}| tee output.txt

