#!/bin/bash

OPTION=$1
IP=$2

INSTANCE_HOME=/home/ubuntu
INSTACE_KEY=/Users/manolo/Documents/k8s-key.pem
INSTANCE_HOST=ubuntu@$IP

scp -i $INSTACE_KEY -r $(pwd)/setup ubuntu@$IP:$HOME_PATH

case $OPTION in
    setup-instance)
        ssh -i $INSTACE_KEY $INSTANCE_HOST -t $INSTANCE_HOME/setup/instance.sh 
    ;;
    setup-master-node) 
        ssh -i $INSTACE_KEY $INSTANCE_HOST -t $INSTANCE_HOME/setup/master.sh $IP
    ;;
    setup-worker-node)
        ssh -i $INSTACE_KEY $INSTANCE_HOST -t $INSTANCE_HOME/setup/worker.sh 
    ;;
    *)
        echo option not found
        exit 1
    ;;
esac
