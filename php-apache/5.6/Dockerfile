# The container includes:
#
# - Git
# - Apache2
# - PHP Version 5.6
# - Composer
# - Node
# - MySQL Client
# - PostgreSQL Client
# - MongoDB

FROM azukiapp/php-apache:base
MAINTAINER Azuki <support@azukiapp.com>

# Add PHP repository to apt source
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main" \
        > /etc/apt/sources.list.d/php5-5.6.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C

# Install php5 + apache2 + DB clients
RUN apt-get update \
  && apt-get -yq upgrade \
        apache2 \
        libapache2-mod-php5 \
        php5-dev \
        php5-cli \
        php5-mysql \
        php5-pgsql \
        php5-mcrypt \
        php5-curl \
        php5-ldap \
        php5-gd \
        php-pear \
        php-apc \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# From azukiapp/php-apache:base image
CMD ["/run.sh"]
