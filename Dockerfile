ARG PHP_VERSION=7.4
ARG NODE_VERSION=14

FROM thecodingmachine/php:$PHP_VERSION-v4-apache-node$NODE_VERSION

USER root

RUN apt-get update \
 && apt-get install -y mysql-client --no-install-recommends

RUN composer self-update --2

USER docker

COPY assets/composer.json ~/.composer/composer.json

RUN composer global install \
 && rm -rf ~/.composer/cache