#!/bin/bash
#1. Build and Runs the Docker-Compose Envoirment
#2. Clears unnecessary images
BUILD=$1

if [ -z "$BUILD" ];
then
    echo "No Build Service provided - Building all services"
    BUILD="full"
else
    echo "Build is: $BUILD"
fi

if [[ $BUILD = "full" ]];
then
    docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.prod.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    down --remove-orphans -v
    
    
    docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.prod.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    up -d \
    --build \
    # runs only one container
    # --no-deps expressdocker \
else
    docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.prod.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    up -d \
    --build $BUILD \
    # runs only one container
    # --no-deps expressdocker \
fi

if [[ $BUILD = "down" ]];
then
    docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.prod.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    down --remove-orphans -v
fi

if [[ $BUILD = "prune" ]];
then
    docker image prune
    docker volume prune
    docker network prune
fi

