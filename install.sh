#!/bin/bash

main_app() {
  if [ $1 ]; then
    env=$1
  else
    echo ----- Default environment is dev -----
    env="dev"
  fi
  loadEnv $env
  installSymfony
  loadDockerCompose
  applicationReady
}

loadEnv() {
  echo ----- Loading .env variable from $1 -----
  loadFile .env
  loadFile .env.local
  loadFile .env.$1
  loadFile .env.$1.local
}

loadFile() {
  envFile=$1
  if [ -f $envFile ]; then
    export $(echo $(cat $envFile | sed 's/#.*//g'| xargs) | envsubst)
  fi
}

installSymfony() {
  if [ ! -d "App" ]; then
    echo ----- Getting Symfony app -----
    symfony new --full App
  else
    echo ----- Skipping Symfony download
  fi
}

loadDockerCompose() {
  echo ----- Build and up docker image -----
  docker-compose build
  docker-compose up -d
}

applicationReady() {
  echo ----- Application info -----
  echo ----- Application: http://localhost:${NGINX_PORT:-80} -----
  echo ----- adminer: http://localhost:${ADMINER_PORT:-8080} -----
  echo ----- maildev: http://localhost:${MAILDEV_PORT:-8081} -----
  echo ----- DB url: $DATABASE_URL -----
}

main_app $1