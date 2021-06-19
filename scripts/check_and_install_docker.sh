#!/usr/bin/env bash

# Check if Docker is avialable
docker --version 2>&1 >/dev/null
DOCKER_IS_AVAILABLE=$?
if [ $DOCKER_IS_AVAILABLE -ne 0 ];
then
    # Docker is unavailable
    echo "Docker is not available. Installing."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    read -p "Enter the user to be added to docker group for non  root access (e.g. pi) : " user_name
    usermod -aG docker $user_name
    echo ""
    echo ""
fi
#  Add Admin user later on using  sudo usermod -aG docker your-user

# Check if Docker Compose is avialable
docker-compose --version 2>&1 >/dev/null
DOCKER_COMPOSE_IS_AVAILABLE=$?
if [ $DOCKER_COMPOSE_IS_AVAILABLE -ne 0 ];
then
    # Docker Compose is unavailable
    echo "Docker Compose is not available. Installing."
    apt-get install docker-compose
    echo ""
    echo ""
fi
