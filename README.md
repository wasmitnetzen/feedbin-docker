#Feedbin

Feedbin dockerized

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

#Requirements

- Docker
- Docker-compose

#Instructions

The quickest deployment is with Docker Cloud. You can also clone this repository and run `docker-compose up'.

Ensure you review and populate all of the environment variables.

After the initial deployment, enter a terminal session within the "feedbin" container and execute `cd /opt/feedbin && rake db:setup` which sets up the Postgres database for first time usage.

