# The container includes:
#
# azukiapp/web-based:
# * Ubuntu 14.04
# * Git
# * VIM
# * NodeJS
# * MySQL Client
# * PostgreSQL Client
# * MongoDB
#

FROM ubuntu:14.04
MAINTAINER Azuki <support@azukiapp.com>

# ==============================================================================
# Ubuntu Linux 14.04
# ==============================================================================

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Ensure UTF-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN dpkg-reconfigure locales

# Install build dependencies
RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get -yq install \
        build-essential \
        ca-certificates \
        curl \
        wget \
        bindfs \
        vim \
        git-core && \
    apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ==============================================================================
# Install Postgres, MySQL, MongoDB and more dependencies
# ==============================================================================

ENV PG_MAJOR 9.3
ENV PG_VERSION 9.3.4

# Add PostgreSQL Global Development Group apt source
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    > /etc/apt/sources.list.d/pgdg.list

# Add PGDG repository key
RUN wget -qO - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc \
    | apt-key add -

RUN apt-get update -qq && \
    apt-get install -y -qq \
      libcurl4-openssl-dev \
      libffi-dev \
      libgdbm-dev \
      libpq-dev \
      libreadline6-dev \
      libssl-dev \
      libtool \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      software-properties-common \
      zlib1g-dev \
      mongodb \
      mysql-client \
      postgresql-client-$PG_MAJOR && \
    apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Set bash as a default process
CMD ["bash"]
