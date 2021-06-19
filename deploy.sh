#!/usr/bin/env bash

# Fetch current git branch
branch=$(git rev-parse --abbrev-ref HEAD)

check_and_install_docker(){
    echo 'Verifying Docker Installation!'
    cd scripts
    ./check_and_install_docker.sh
    echo ''
    echo ''
}

pull_from_git(){
    echo "Pulling updates from git !"
    git pull --progress https://oksbwn:love2%40kiti@github.com/oksbwn/OpenHAB3-Installation-Configurations $branch
}
check_volumes_folder(){
    if [ ! -d "/opt/volumes" ]; then
        echo '/opt/volumes folder does not exist.'
        mkdir -p /opt/volumes
    fi
}

deploy_containers(){
    # Deploying the containers
    echo "Deploying the containers !"
    docker-compose up --build --detach
    echo ""
    echo ""
    
    # Restart required containers
    echo "Restarting nginx container!"
    docker restart nginx
    echo ""
    echo ""
    
    # Stop unnecessary containers
    echo "Stopping not necessary containers"
    # docker stop cordova_builder
    docker stop mongo-express
}

check_volumes_folder
check_and_install_docker
pull_from_git
deploy_containers

echo "Task Complete!"
echo ""
echo ""

