#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "This script will build all images in docker-images/ directory"

AUTHOR="anonymous"

if [ $# -eq 1 ]
  then
    echo "Using given author: $1"
    AUTHOR="$1"
else
  echo "Warning: no specific author set. Will use $AUTHOR"
  sleep 5
fi

for i in $(ls docker-images/)
do
  
  docker build -f $DIR/docker-images/$i/Dockerfile -t $AUTHOR/$i $DIR/docker-images/$i/
done
