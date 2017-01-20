#!/bin/bash

REPO='mysql'
NAME='localmysql'
PASSWORD='root'
DATABASE='ayou'

run(){
    if [[ `docker ps -a | awk '{print $NF}' | grep "${NAME}"` ]]; then
        docker start ${NAME}
    else
        docker run -d --name ${NAME} -e MYSQL_ROOT_PASSWORD=${PASSWORD} -e MYSQL_DATABASE=${DATABASE} -p 3306:3306 ${REPO} --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
    fi
}

run
