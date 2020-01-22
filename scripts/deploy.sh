#!/usr/bin/env bash

# Login to docker hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t kloppz/papermc:$PAPER_VERSION --build-arg PAPER_VERSION=$PAPER_VERSION .
docker push kloppz/papermc:$PAPER_VERSION
