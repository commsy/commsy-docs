#!/bin/bash

docker build . -t commsy-docs
docker run --rm -p 8080:80 commsy-docs