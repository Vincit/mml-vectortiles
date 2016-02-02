#!/usr/bin/env bash

docker kill mml-vectortiles &> /dev/null
docker rm mml-vectortiles &> /dev/null
docker run --name="mml-vectortiles" -d -p 80:80 \
    -v ~/mml:/data \
    vincit/mml-vectortiles
