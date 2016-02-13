FROM ubuntu:14.04
MAINTAINER Joseph Scavone
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update ;\
    apt-get install -y software-properties-common ;\
    add-apt-repository ppa:brightbox/ruby-ng-experimental ;\
    apt-get update ;\
    apt-get install -y ruby2.3 ruby2.3-dev build-essential curl libreadline-dev libcurl4-gnutls-dev libpq-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev git-core libmagickwand-dev libopencv-dev python-opencv postgresql-client

RUN \
    cd /opt ;\
    git clone https://github.com/feedbin/feedbin.git ;\
    cd feedbin ;\
    gem install bundler redis

ADD config/database.yml /opt/feedbin/config/database.yml

RUN \
    cd /opt/feedbin ;\
    bundle

ARG POSTGRES_URL=192.168.0.180:5432
ARG ELASTICSEARCH_URL=http://192.168.0.180:9200
ARG MEMCACHED_HOSTS=192.168.0.180:11211
ARG POSTGRES_PASSWORD=feedbin
ARG POSTGRES_USERNAME=feedbin
ARG RACK_ENV=production
ARG RAILS_ENV=production
ARG REDIS_URL=redis://192.168.0.180:6379
ARG SECRET_KEY_BASE=insertsecret
ARG DATABASE_URL=postgres://${POSTGRES_USERNAME}:${POSTGRES_PASSWORD}@${POSTGRES_URL}/feedbin_production

ADD config/environments/production.rb /opt/feedbin/config/environments/production.rb

RUN \
    cd /opt/feedbin ;\
    rake db:drop && rake db:setup

ADD startup.sh /feedbin-start

CMD ["/bin/bash", "/feedbin-start"]

EXPOSE 80
EXPOSE 9292
