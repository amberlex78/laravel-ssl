FROM php:8.3-fpm

# User arguments
ARG PUID=1000
ARG PGID=1000

# Set working directory
WORKDIR /var/www/front

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Tools for building and configuring extensions
    autoconf \
    pkg-config \
    # Libraries for image processing (GD extension)
    libpng-dev \
    libjpeg62-turbo-dev \
    libwebp-dev \
    libfreetype6-dev \
    # Libraries for compression and encryption
    libzip-dev \
    libssl-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install gd pdo_mysql zip 

# Clean up unnecessary files to reduce image size
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure user and permissions
RUN groupmod -g $PGID www-data \
    && usermod -u $PUID -g www-data www-data \
    && chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www

# Copy custom PHP configuration
COPY php.ini /usr/local/etc/php/conf.d/

# Switch to www-data user for security
USER www-data

# Expose PHP-FPM port
EXPOSE 9000
