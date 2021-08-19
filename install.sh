#!/bin/bash

main_app() {
  if [ $1 ]; then
    env=$1
  else
    echo ----- Default environment is dev -----
    env="dev"
  fi
  installSymfony
  loadEnv $env
  loadDockerCompose
  installDependance
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
    echo ----- Skipping Symfony download -----
  fi
}

installDependance() {
  echo ----- Install dependancies with composer and yarn -----
  if [ ! -d "App/node_modules" ]; then
    docker exec phpnodecli_symfony_${PROJECT_NAME:-symfony-docker} composer update
    docker exec phpnodecli_symfony_${PROJECT_NAME:-symfony-docker} composer require symfony/webpack-encore-bundle
    docker exec phpnodecli_symfony_${PROJECT_NAME:-symfony-docker} yarn install
  else
    echo ----- Skipping dependancies already install -----
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
  echo ----- DB url: mysql://root:$MYSQL_ROOT_PASSWORD@localhost:${MARIADB_PORT:-3306}/${DB_NAME}?serverVersion=mariadb-10.6.3 -----
}

main_app $1