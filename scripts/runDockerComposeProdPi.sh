#1. Build and Runs the Docker-Compose Envoirment
#2. Clears unnecessary images
BUILD=$1

# if [[ $BUILD = "" ]];
#     then 
#     echo "123"
# fi

WebsiteMainDocker="/c/Users/Sandro/Dropbox/0_Webdevelopment/Docker/Live/BackendServerMainDocker/"
WebsiteExpressMongo="/c/Users/Sandro/Dropbox/0_Webdevelopment/Projects/NodeJs/Live/PersonalWebsiteExpressMongoDB/"
LeagueAbuserBackend="/c/Users/Sandro/Dropbox/0_Webdevelopment/Projects/NodeJs/Live/LeagueAbuserBackend/"

if [[ $BUILD = "full" ]];
    then 
        docker-compose \
            -f ${WebsiteMainDocker}docker-compose.yaml \
            -f ${WebsiteMainDocker}docker-compose.dev.yaml \
            -f ${WebsiteExpressMongo}docker-compose.yaml \
            -f ${WebsiteExpressMongo}docker-compose.dev.yaml \
            -f ${LeagueAbuserBackend}docker-compose.yaml \
            -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
            down --remove-orphans -v


        docker-compose \
            -f ${WebsiteMainDocker}docker-compose.yaml \
            -f ${WebsiteMainDocker}docker-compose.dev.yaml \
            -f ${WebsiteExpressMongo}docker-compose.yaml \
            -f ${WebsiteExpressMongo}docker-compose.dev.yaml \
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
            -f ${WebsiteExpressMongo}docker-compose.yaml \
            -f ${WebsiteExpressMongo}docker-compose.dev.yaml \
            -f ${LeagueAbuserBackend}docker-compose.yaml \
            -f ${LeagueAbuserBackend}docker-compose.dev.yaml \
            up -d \
            --build $BUILD \
            # runs only one container
            # --no-deps expressdocker \
fi


if [[ $BUILD = "prune" ]];
    then 
        docker image prune
        docker volume prune
        docker network prune
fi

