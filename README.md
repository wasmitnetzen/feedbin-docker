#Feedbin

Feedbin dockerized

#Requirements

- Docker

#Instructions

You can clone this repository and run `docker-compose up', but this is not a plug-and-play solution. Ensure you review and populate all of the environment variables.


After the initial deployment, enter a terminal session within the "feedbin" container and execute `cd /opt/feedbin && rake db:setup` which sets up the Postgres database for first time usage.

After an upgrade, do the same and run `cd /opt/feedbin && rake db:migrate`.