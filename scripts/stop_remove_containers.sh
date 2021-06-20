#!/usr/bin/env bash

echo 'Stopping all containers!'
docker stop $(docker ps -q)

echo 'Removing all containers!'
docker rm $(docker ps -a -q)