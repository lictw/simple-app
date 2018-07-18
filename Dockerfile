FROM php:7.2-fpm-stretch

WORKDIR /application
COPY . .

RUN apt-get update && apt-get install -y git unzip --no-install-recommends && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install
