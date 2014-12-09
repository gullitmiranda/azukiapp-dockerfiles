FROM ubuntu:trusty
MAINTAINER Azuki <support@azukiapp.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get -yq install \
        build-essential \
        ca-certificates \
        curl \
        wget \
        bindfs \
        git-core

# Add PostgreSQL Global Development Group apt source
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
        > /etc/apt/sources.list.d/pgdg.list && \
    wget -qO - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" \
        > /etc/apt/sources.list.d/php5-5.6.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

# Install php5 + apache2 + DB clients
RUN apt-get update && \
    apt-get -yq install \
        apache2 \
        libxml2 \
        libcurl4-openssl-dev \
        libapache2-mod-php5 \
        php5-dev \
        php5-cli \
        php5-mysql \
        php5-pgsql \
        php5-mcrypt \
        php5-curl \
        php5-json \
        php5-gd \
        php-pear \
        php-apc \
        mongodb \
        mysql-client \
        postgresql-client-9.3 && \
    pecl install mongo

# Enable php and apache modules
RUN echo "extension=mongo.so" > /etc/php5/mods-available/mongo.ini
RUN a2enmod rewrite && \
    php5enmod mcrypt mongo

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN sed -i 's/\/var\/www\/html/\/var\/www/g' /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clean up APT and temporary files when done
RUN apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www && ln -s /app /var/www
ADD sample/ /app

EXPOSE 80
WORKDIR /app
CMD ["/run.sh"]
