FROM php:8.2-fpm-bookworm
ENV COMPOSER_ALLOW_SUPERUSER=1
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install sockets pdo_mysql zip bcmath opcache &&\
    docker-php-ext-enable sockets

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy Laravel application files
COPY . .

# Install Laravel dependencies
RUN composer install --optimize-autoloader --no-dev

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port
EXPOSE 9001

# Start PHP-FPM
CMD ["php-fpm"]