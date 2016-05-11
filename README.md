Raspberry Pi Cloud 9 IDE Dockerfile
============
# rpi-cloud9-ide
Automated Cloud 9 IDE Build for the Raspberry Pi.
(https://github.com/hwegge2/rpi-cloud9-ide)

This repository contains the Dockerfile for setting up a Cloud9 IDE on a Raspberry Pi. 

## Get Latest

- git clone (https://github.com/hwegge2/rpi-cloud9-ide)
- cd rpi-cloud9-ide

## Features:

- No Defined Authentication
- User Defined Authentication
- Custom Workspace directory via mounting Volume containers
- Automated Build Process

# Base Docker Image
[resin/rpi-raspbian:wheezy] (https://hub.docker.com/r/resin/rpi-raspbian/)

## Installation 

Download the automated build from the Docker Hub Registry:

docker pull hwegge2/rpi-cloud9-ide

You can also build an image from the Dockerfile:

docker build -t="$USER/rpi-cloud9-ide" github.com/hwegge2/rpi-cloud9-ide

## Usage

No Defined Authentication

docker run --name rpi-cloud9-ide -it -d -p 8181:8181 -v ~/projects:/workspace hwegge2/rpi-cloud9-ide node server.js -w/workspace --listen 0.0.0.0 -a :

User Defined Authentication

docker run --name rpi-cloud9-ide -it -d -p 8181:8181 -v ~/projects:/workspace hwegge2/rpi-cloud9-ide node server.js -w/workspace --listen 0.0.0.0 -a demouser:password

Custom Workspace directory via mounting Volume containers

docker run --name rpi-cloud9-ide -it -d -p 8181:8181 -v /Your Defined Path/Workspace hwegge2/rpi-cloud9-ide node server.js -w/workspace --listen 0.0.0.0 -a :