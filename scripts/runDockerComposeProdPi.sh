#1. Build and Runs the Docker-Compose Envoirment
#2. Clears unnecessary images
CLEAR=$1

docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.pi.yaml \
    -f ${ExpressMongoDBPath}docker-compose.yaml \
    -f ${ExpressMongoDBPath}docker-compose.pi.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    down --remove-orphans -v

docker-compose \
    -f ${MainDockerPath}docker-compose.yaml \
    -f ${MainDockerPath}docker-compose.pi.yaml \
    -f ${ExpressMongoDBPath}docker-compose.yaml \
    -f ${ExpressMongoDBPath}docker-compose.pi.yaml \
    -f ${LeagueAbuserBackend}docker-compose.yaml \
    -f ${LeagueAbuserBackend}docker-compose.pi.yaml \
    up -d \
    --build \
    # runs only one container
    # --no-deps expressdocker \


if [[ $CLEAR = "prune" ]];
    then 
        docker image prune
        docker volume prune
        docker network prune
fi
