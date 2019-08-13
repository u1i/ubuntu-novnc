#!/bin/bash

if [ "$vncpassword" = "" ]
then
    vncpassword="insecure"
fi

#printf "axway99\naxway99\n\n" | vncserver :1
printf "$vncpassword\n$vncpassword\n\n" | vncserver :1
/.novnc/utils/launch.sh --vnc localhost:5901 --listen 8080
