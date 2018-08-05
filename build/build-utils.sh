#!/bin/sh -xe

# This script builds the akroma-mn-utils binary within the docker container

DOCKER_CONTAINER_ID=$(docker ps | grep centos | awk '{print $1}')
docker logs $DOCKER_CONTAINER_ID
docker exec -ti $DOCKER_CONTAINER_ID /bin/bash -xec "cd /akroma-masternode-management/source && pyinstaller --onefile --noconfirm --clean --log-level=WARN --strip --runtime-tmpdir /dev/shm akroma-mn-utils.py &&
  echo -ne \"------\nEND akroma-mn-utils BUILD\n\";"