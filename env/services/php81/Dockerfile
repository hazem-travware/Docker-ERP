FROM php:8.1-fpm
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update --fix-missing && \
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
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
RUN docker-php-ext-install pdo && \
    docker-php-ext-install pdo_sqlite &&  \
    docker-php-ext-install mysqli && \
    docker-php-ext-install curl && \
    docker-php-ext-install zip
RUN    docker-php-ext-install -j$(nproc) intl && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install gettext && \
    docker-php-ext-install posix && \
    docker-php-ext-install pcntl && \
    docker-php-ext-install exif
RUN apt-get -y update && \
    apt-get --no-install-recommends install -y libfreetype6-dev \
libjpeg62-turbo-dev \
libpng-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd
RUN rm -rf /usr/src/*
RUN apt-get update && apt-get install vim -y && \
    apt-get install openssl -y && \
    apt-get install libssl-dev -y && \
    apt-get install wget -y && \
    apt-get install procps -y && \
    apt-get install htop -y
RUN apt-get install -y git
RUN apt-get install -y postgresql-client
#RUN pecl install xdebug \
#   && docker-php-ext-enable xdebug
RUN pecl install redis && \
    docker-php-ext-enable redis

RUN apt-get install -y supervisor

RUN cp /env/config/supervisor/supervisor.conf /etc/supervisord.conf

RUN chmod +x /env/config/supervisor/run.sh

ENTRYPOINT ["/var/www/docker/run.sh"]
ARG user
ARG uid
RUN useradd -u $uid $user
RUN mkdir /home/$user/
RUN chown -R $user:$user /var/www/html
RUN chown -R $user:$user /home/$user/
USER $user
WORKDIR /var/www/html