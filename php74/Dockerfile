FROM php:7.4-fpm
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install redis
RUN echo "extension=redis.so" >>/usr/local/etc/php/conf.d/docker-php-ext-redis.ini

RUN apt-get update

RUN apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev
RUN pecl install mongodb
RUN echo "extension=mongodb.so" >>/usr/local/etc/php/conf.d/docker-php-ext-mongodb.ini

RUN apt-get install -y libicu-dev
RUN docker-php-ext-install intl