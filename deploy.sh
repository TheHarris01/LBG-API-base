#!/bin/bash

DOCKERHUB_USER=mrsiharris22

APP_NAME=lbg-api-app

docker rmi -f ${DOCKERHUB_USER}/${APP_NAME}

docker build -t ${DOCKERHUB_USER}/${APP_NAME} .

docker push ${DOCKERHUB_USER}/${APP_NAME}

docker rm -f ${APP_NAME}

docker run -d -p 80:4000 --name ${APP_NAME} ${DOCKERHUB_USER}/${APP_NAME}

docker system prune -f
