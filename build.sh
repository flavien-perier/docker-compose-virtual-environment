#!/bin/bash

set -e

GIT_FOLDER=".."
DOCKER_IMAGE_PREFIX="flavienperier"

build() {
    FOLDER="$1"
    NAME="$2"

    echo "Build image $NAME"

    (
        cd "$GIT_FOLDER/$FOLDER"
        docker buildx build -t "$DOCKER_IMAGE_PREFIX/$NAME" .
    )
    
}

build "dockerfile-dns" "dns"
build "dockerfile-jupyter" "jupyter"
build "dockerfile-openssl" "openssl"
build "dockerfile-owa" "owa"
build "dockerfile-proxy" "proxy"
build "dockerfile-sandbox-hack" "sandbox-hack"
build "dockerfile-sandbox-dev" "sandbox-dev"
build "flavien-website" "flavien-website"
build "markdown-api" "markdown-api"
build "eco-webserver" "eco-webserver"

echo 'DOMAIN=domain.lan
PASSWORD=password
SANDBOX_LOCATION=/home/user/sandbox-files' > .env

docker compose down

docker compose up -d

sleep 5

curl -x 127.0.0.1:3128 https://website.domain.lan/
curl -x 127.0.0.1:3128 https://jupyter.domain.lan/