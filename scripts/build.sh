#!/usr/bin/env bash

./gradlew clean build

docker build . -t topriddy/udacity-capstone-app