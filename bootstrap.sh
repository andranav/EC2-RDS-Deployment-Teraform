#!/bin/bash

sudo apt update
sudo apt install docker.io -y
sudo docker run -p 5000:5000 -e DB_USERNAME=${db_username} \
                             -e DB_PASSWORD=${db_password} \
                             -e DB_ENDPOINT=${db_endpoint} \
                             -e DB_NAME=${db_name} \
 andranav/flask-docker-demo-app:1.0
