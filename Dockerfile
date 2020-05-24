FROM php:7.4-apache

RUN apt-get update

# 1. development packages
RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    libzip-dev \
    g++

# 2. Clear cache
RUN apt-get clean

# 3. apache configs + document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 4. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 5. start with base php config, then add extensions
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN docker-php-ext-install \
    bz2 \
    bcmath \
    calendar \
    exif \
    gd \
    iconv \
    intl \
    opcache \
    pcntl \
    pdo_mysql \
    zip

# 6. composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 7. Laravel
RUN git clone https://github.com/laravel/laravel.git /var/www/html && \
    cd /var/www/html && \
    curl https://raw.githubusercontent.com/gabotronix/laravel-docker-dev-files/master/env -o .env