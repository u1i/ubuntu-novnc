#!/bin/bash

if [ "$vncpassword" = "" ]
then
    vncpassword="insecure"
fi

printf "$vncpassword\n$vncpassword\n\n" | vncserver :1
/.novnc/utils/launch.sh --vnc localhost:5901 --listen 8080
