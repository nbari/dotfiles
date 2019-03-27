#!/usr/bin/env zsh

cleanup(){
    echo  "exit code $?"
    running=0
}

trap cleanup SIGCHLD

running=1
sleep 5 &

while [ $running = 1 ]; do
    echo -n .
    sleep 1
done
