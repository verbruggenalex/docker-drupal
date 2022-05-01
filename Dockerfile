ARG PHP_EXTENSIONS="mysqli"

FROM thecodingmachine/php:$TAG

USER root

RUN apt-get update \
 && apt-get install -y mysql-client --no-install-recommends

USER docker

ADD --chown=docker:docker assets/composer.json /home/docker/.composer/composer.json

RUN composer global require composer/installers cweagans/composer-patches dealerdirect/phpcodesniffer-composer-installer ergebnis/composer-normalize php-parallel-lint/php-parallel-lint phpro/grumphp \
 && rm -rf ~/.composer/cache