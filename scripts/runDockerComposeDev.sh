#!/bin/bash
#1. Build and Runs the Docker-Compose Envoirment
#2. Clears unnecessary images

PLATFORM=$1
BUILD=$2

WebsiteMainDocker=""
WebsiteExpressMongo=""
LeagueAbuserBackend=""

if [ -z "$PLATFORM" ];
then
    echo "No PLATFROM Provided"
    exit
fi

if [ $PLATFORM = "windows" ] || [ $PLATFORM = "linux" ] || [ $PLATFORM = "mac" ]
then
    echo "Platform is: $PLATFORM"
    
else
    echo "Please provide a valid Platform"
    exit
fi

if [ -z "$BUILD" ];
then
    echo "No Build Service provided - Building all services"
    BUILD="full"
else
    echo "Build is: $BUILD"
fi

if [[ $PLATFORM == "windows" ]];
then
    WebsiteMainDocker="/c/Users/Sandro/Dropbox/0_Webdevelopment/Docker/Live/BackendServerMainDocker/"
    LeagueAbuserBackend = "/c/Users/Sandro/Dropbox/0_Webdevelopment/Projects/NodeJs/Live/LeagueAbuserBackend/"
fi

if [[ $PLATFORM == "linux" ]];
then
    WebsiteMainDocker="/home/sandro/Dropbox/0_Webdevelopment/Docker/Live/BackendServerMainDocker/"
    LeagueAbuserBackend="/home/sandro/Dropbox/0_Webdevelopment/Projects/NodeJs/Live/LeagueAbuserBackend/"
fi

if [[ $PLATFORM == "mac" ]];
then
    WebsiteMainDocker="/Users/sandrospengler/Dropbox/0_Webdevelopment/Docker/Live/BackendServerMainDocker/"
    LeagueAbuserBackend="/Users/sandrospengler/Dropbox/0_Webdevelopment/Projects/NodeJs/Live/LeagueAbuserBackend/"
fi

if [[ $BUILD == "full" ]];
then
    docker-compose \
    -f ${WebsiteMainDocker}docker-compose.yaml \
    -f ${WebsiteMainDocker}docker-compose.dev.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
    down --remove-orphans -v
    
    
    docker-compose \
    -f ${WebsiteMainDocker}docker-compose.yaml \
    -f ${WebsiteMainDocker}docker-compose.dev.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
    up -d \
    --build \
    # runs only one container
    # --no-deps expressdocker \
else
    docker-compose \
    -f ${WebsiteMainDocker}docker-compose.yaml \
    -f ${WebsiteMainDocker}docker-compose.dev.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
    down --remove-orphans -v
    
    
    docker-compose \
    -f ${WebsiteMainDocker}docker-compose.yaml \
    -f ${WebsiteMainDocker}docker-compose.dev.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
    up -d \
    --build $BUILD\
    # runs only one container
    # --no-deps expressdocker \
fi


if [[ $BUILD == "down" ]];
then
    docker-compose \
    -f ${WebsiteMainDocker}docker-compose.yaml \
    -f ${WebsiteMainDocker}docker-compose.dev.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
    down --remove-orphans -v
fi

if [[ $BUILD == "prune" ]];
then
    docker image prune
    docker volume prune
    docker network prune
    docker system prune
fi

