FROM php:5.6-fpm-alpine

RUN apk update; \
    apk upgrade;

# Install your extensions
RUN apk add --update bash nano vim zip unzip curl nodejs npm

RUN apk add --no-cache libssh2-dev openssl libxml2-dev libmcrypt-dev bzip2-dev postgresql-dev gmp-dev icu-dev

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        freetype-dev \
        libpng-dev \
        jpeg-dev \
        libjpeg-turbo-dev

RUN apk add --no-cache --virtual .deps \
		imagemagick \
		imagemagick-libs \
		imagemagick-dev

# Install PHP extensions
#RUN docker-php-ext-install pdo mysqli pdo_mysql mbstring bcmath intl imagick
RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && docker-php-ext-install -j$(nproc) bcmath exif iconv mcrypt mysqli opcache mbstring pdo pdo_mysql soap zip \
    && docker-php-ext-configure bz2 --with-bz2=/usr/include/ \
    && docker-php-ext-install -j$(nproc) bz2 \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql \
    && docker-php-ext-configure gmp --with-gmp=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gmp \
    && pecl install apcu-4.0.11 \
    && pecl install imagick-3.4.3 \
    && pecl install redis-4.1.1 \
    && pecl install ssh2-0.13 \
    && docker-php-ext-enable apcu imagick redis ssh2 \
    && pecl install intl \
    && docker-php-ext-install intl

# Install Xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/bin
ENV PATH /root/.composer/vendor/bin:$PATH