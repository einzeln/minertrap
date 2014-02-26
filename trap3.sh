#!/bin/bash

THIS_PID=$$   
echo "THIS_PID=$THIS_PID"  
trap "./killbash" INT TERM 

while [ 1 ]
do 
	./bashminer &

	sleep 3600

	#kill the cgminer 
	LAST_PID=$(ps -ef|grep 'miner'|grep -v grep|awk '{print $2}')  	

	arr=(${LAST_PID// / })  
	  
	for subpid in ${arr[@]}  
	do  
	    	echo $subpid

		if [ -n "$subpid" ] &&  [ "$subpid" -gt 0 ]; then   
			echo "miner [$subpid] PROCESS NOT EXIT, NOW KILL IT!"  
			kill -kill $subpid 
		fi  
	done

    	sleep 60  
done
