FROM php:{{php_version}}-cli
COPY bin/* /usr/local/bin
RUN apt-install libssl-dev && \
    docker-php-pecl-install mongo{{mongo_version}} xdebug{{xdebug_version}} && \
    apt-get purge -y --auto-remove libssl-dev
