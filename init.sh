#!/usr/bin/env bash

set -Ceux

if [ ! -e "./src" ]; then
  mkdir src
fi

function appCloneIfNotExists(){
  local reposName=$1

  if [ ! -e "./src/$reposName" ]; then
    cd src
    git clone git@github.com:kannan-xiao4/$reposName.git
    cd ../
  fi
}

appCloneIfNotExists "chatbot-front"
appCloneIfNotExists "chatbot-back"

docker-compose up -d --build