FROM php:8.1.0-fpm

RUN apt-get update && apt-get install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip gnupg2 \
&& docker-php-ext-install intl opcache pdo pdo_mysql \
&& pecl install apcu \
&& docker-php-ext-enable apcu \
&& docker-php-ext-configure zip \
&& docker-php-ext-install zip \
&& docker-php-ext-install pdo_mysql

WORKDIR /var/www/project

RUN chmod -R 777 .

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://get.symfony.com/cli/installer | bash

RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony