FROM ubuntu:14.04
MAINTAINER Joseph Scavone
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update ;\
    apt-get install -y software-properties-common ;\
    add-apt-repository ppa:brightbox/ruby-ng-experimental ;\
    apt-get update ;\
<<<<<<< HEAD
    apt-get install -y ruby2.3 ruby2.3-dev build-essential curl libreadline-dev libcurl4-gnutls-dev libpq-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev git-core libmagickwand-dev libopencv-dev python-opencv
=======
    apt-get install -y ruby2.3 ruby2.3-dev build-essential curl libreadline-dev libcurl4-gnutls-dev libpq-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev git-core libmagickwand-dev libopencv-dev python-opencv postgresql-client
>>>>>>> a9cd0e33256a69c4a6ed2461d3c3a0d7084afede

ENV SECRET_KEY_BASE=${SECRET}
ENV POSTGRES=192.168.0.180
ENV POSTGRES_USERNAME=feedbin
<<<<<<< HEAD
=======
ENV POSTGRES_PASSWORD=feedbin
>>>>>>> a9cd0e33256a69c4a6ed2461d3c3a0d7084afede
ENV DATABASE_URL=postgres://${POSTGRES_USERNAME}:${POSTGRES_PASSWORD}@${POSTGRES}/feedbin_production

RUN \
    cd /opt ;\
    git clone https://github.com/feedbin/feedbin.git ;\
    cd feedbin ;\
    gem install bundler redis

ADD config/database.yml /opt/feedbin/config/database.yml

RUN \
    cd /opt/feedbin ;\
    bundle

<<<<<<< HEAD
ARG POSTGRES=192.168.0.180
ENV POSTGRES_PASSWORD=feedbin
ENV DATABASE_URL=postgres://${POSTGRES_USERNAME}:${POSTGRES_PASSWORD}@${POSTGRES}/feedbin_production


RUN \
    cd /opt/feedbin ;\
    rake db:drop

RUN apt-get install -y postgresql-client


RUN \
    cd /opt/feedbin ;\
    rake db:setup
=======



RUN \
    cd /opt/feedbin ;\
    rake db:drop && rake db:setup
>>>>>>> a9cd0e33256a69c4a6ed2461d3c3a0d7084afede


ADD startup.sh /feedbin-start

CMD ["/bin/bash", "/feedbin-start"]

EXPOSE 9292
