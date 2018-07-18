FROM php:7.2-fpm-stretch

WORKDIR /application
COPY . .

RUN apt-get update && apt-get install -y git unzip mysql-client --no-install-recommends && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install && \
    docker-php-ext-install pdo_mysql && \
    mv .env.example .env && \
    chown -R www-data. .
