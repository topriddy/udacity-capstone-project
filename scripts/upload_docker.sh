#!/usr/bin/env bash
dockerpath="topriddy/udacity-capstone-app"

docker login

docker tag udacity-capstone-app "$dockerpath:latest"

echo "Docker ID and Image: $dockerpath"

docker push "$dockerpath:latest"