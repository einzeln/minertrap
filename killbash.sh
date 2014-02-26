#!/bin/bash

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


#kill the parent bash
PARENT_PID=$PPID   
echo "PARENT_PID=$PARENT_PID"  
kill -kill $PARENT_PID

