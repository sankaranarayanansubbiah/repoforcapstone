#!/bin/bash

#Docker build

docker build -t guvitask .

#Docker container creation

docker-compose up -d
