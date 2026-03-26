FROM php:8.2-apache

# Install PostgreSQL dev libraries, then install the extension
RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo_pgsql

# Enable Apache mod_rewrite if needed
RUN a2enmod rewrite

WORKDIR /var/www/html