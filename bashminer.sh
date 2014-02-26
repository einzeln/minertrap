#!/bin/bash

SUB_PID=$$  
echo "SUB_PID=$SUB_PID"  
trap "kill -kill $SUB_PID" INT TERM 

while [ 1 ]
do
../cgminer --text-only

sleep 30
done
