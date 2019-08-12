#!/bin/bash

#cd /.novnc
printf "axway99\naxway99\n\n" | vncserver :1
/.novnc/utils/launch.sh --vnc localhost:5901 --listen 6901
