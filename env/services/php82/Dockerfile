FROM php:8.2-fpm
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y --fix-missing && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils && \
    apt-get -y --no-install-recommends install nano wget \
    dialog \
    libsqlite3-dev \
    libsqlite3-0 && \
    apt-get -y --no-install-recommends install default-mysql-client \
    zlib1g-dev \
    libzip-dev \
    libicu-dev && \
    apt-get -y --no-install-recommends install --fix-missing apt-utils \
    build-essential \
    curl \
    libpq-dev \
    libonig-dev && \
    apt-get -y --no-install-recommends install --fix-missing libcurl4 \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    zip \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# RUN docker-php-ext-install -j$(nproc) intl && \
#     docker-php-ext-install mbstring

# Install required packages and enable SOAP extension
# RUN apt-get update && apt-get install -y \
#     libxml2-dev \
#     && docker-php-ext-install soap


# Install required dependencies and the XSL extension
# RUN apt-get update && apt-get install -y libxslt-dev && \
#     docker-php-ext-install xsl

# RUN docker-php-ext-install dom

# RUN apt-get -y update && \
#     apt-get --no-install-recommends install -y libfreetype6-dev \
#     libjpeg62-turbo-dev \
#     libpng-dev && \
#     rm -rf /var/lib/apt/lists/* && \
#     docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
#     docker-php-ext-install gd
RUN rm -rf /usr/src/*

RUN apt-get -y update && apt-get install vim git -y

RUN apt-get install -y postgresql-client


# RUN docker-php-ext-enable opcache
#RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY ./custom-php.ini /usr/local/etc/php/conf.d/
COPY ./docker-php-ext-opcache.ini /usr/local/etc/php/conf.d/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.5.0


# Install Node.js and npm
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
#     apt-get update && \
#     apt-get install -y nodejs

ARG user
ARG uid

RUN useradd -u $uid $user

RUN mkdir /home/$user/

# RUN chown -R $user:$user /var/www/html
RUN chown -R $user:$user /home/$user/
USER $user

WORKDIR /var/www/html/

RUN touch test.test
# RUN php artisan migrate
