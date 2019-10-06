#!/usr/bin/env bash
dockerpath="topriddy/udacity-capstone-app"

docker tag topriddy/udacity-capstone-app "$dockerpath:$BUILD_NUMBER"

echo "Docker ID and Image: $dockerpath"

docker push "$dockerpath:$BUILD_NUMBER"