#!/bin/sh -xe

# This script builds the akroma-mn-setup binary within the docker container

DOCKER_CONTAINER_ID=$(docker ps | grep centos | awk '{print $1}')
docker logs $DOCKER_CONTAINER_ID
docker run --privileged -d -ti -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup -v `pwd`:/akroma-masternode-management:rw  centos:centos${OS_VERSION}   /usr/sbin/init
docker exec -ti $DOCKER_CONTAINER_ID /bin/bash -xec "cd /akroma-masternode-management/source && pyinstaller --onefile --noconfirm --clean --log-level=WARN --strip --runtime-tmpdir /dev/shm akroma-mn-setup.py &&
  echo -ne \"------\nEND akroma-mn-setup BUILD\n\";"