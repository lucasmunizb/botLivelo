FROM php:8.2-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN a2enmod rewrite
RUN service apache2 restart
