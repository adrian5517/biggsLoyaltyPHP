FROM php:8.2-apache


# Install MySQL PDO extension (use libmariadb-dev as replacement)
RUN apt-get update && \
	apt-get install -y libmariadb-dev && \
	docker-php-ext-install pdo_mysql

# Enable Apache mod_rewrite if needed
# Enable Apache mod_rewrite if needed
RUN a2enmod rewrite

WORKDIR /var/www/html