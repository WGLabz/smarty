#!/usr/bin/env bash

# Fetch current git branch
branch=$(git rev-parse --abbrev-ref HEAD)

# Backup Nodep-RED
backup_nodered(){
    echo "Backing up nodered files"
    sudo cp  /opt/volumes/node-red/data/flows*.json backup/node_red/
    sudo cp  /opt/volumes/node-red/data/flows*cred.json backup/node_red/
    sudo cp  /opt/volumes/node-red/data/settings.js backup/node_red/
    sudo cp  /opt/volumes/node-red/data/package.json backup/node_red/
    sudo cp  /opt/volumes/node-red/data/.config.json backup/node_red/
    sudo cp  /opt/volumes/node-red/data/lib -R backup/node_red/
    sudo cp  /opt/volumes/node-red/data/.sessions.json backup/node_red/
    sudo cp  /opt/volumes/node-red/data/nodes -R backup/node_red/
    echo ''
    echo ''
}
commit_changes(){
    echo "Pushing updates to git !"
    git add .
    read -t 15 -p "Enter the commit message (Autocommit in 15 Seconds) : " message
    if [ -z "$message" ]; then
        echo "No user commit message found, auto commiting."
        currentDate=$(date +%m-%d-%Y-%H:%M)
        message="Commit as of "$currentDate
    fi
    git commit -m "$message"
    git push --progress origin $branch
}

backup_nodered
commit_changes