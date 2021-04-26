#!/bin/bash

dir=$(pwd)/
port=$1
re='^[0-9]+$'
if ! [[ $port =~ $re ]] ; then
  echo "error: Invalid Port" >&1; exit 1
fi
if [ -d "$dir" ]; then
  docker run -d \
        -p $1:80 \
        -v $dir:/usr/share/nginx/html \
        --name test_app \
        nginx:alpine
else
  echo "Error: $dir not found."
    exit 1
fi
