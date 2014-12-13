FROM azukiapp/ubuntu:trusty
MAINTAINER Azuki <support@azukiapp.com>

RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" \
        > /etc/apt/sources.list.d/php5-5.6.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

# Install php5 + apache2 + DB clients
RUN apt-get update \
  && apt-get -yq install \
      libxml2 \
      libcurl4-openssl-dev \
      subversion \
      php5-dev \
      php5-cli \
      php5-sqlite \
      php5-mcrypt \
      php5-curl \
      php5-json \
      php5-gd \
      php-pear \
      sqlite3 libsqlite3-dev \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install phd
RUN git clone https://git.php.net/repository/phd.git \
  && cd phd \
  && sudo pear install package.xml package_generic.xml package_php.xml \

# Enable php and apache modules
#RUN echo "extension=mongo.so" > /etc/php5/mods-available/mongo.ini
#RUN a2enmod rewrite && \
    #php5enmod mcrypt mongo

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
