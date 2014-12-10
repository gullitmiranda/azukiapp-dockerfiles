# The container includes:
#
# * Ubuntu 14.04
# * MRI Ruby 2.1.2
# * Bundler
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
        git-core

# ==============================================================================
# Ruby with postgres, mysql and mongodb support
# ==============================================================================

# Add PostgreSQL Global Development Group apt source
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    > /etc/apt/sources.list.d/pgdg.list

# Add PGDG repository key
RUN wget -qO - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc \
    | apt-key add -

# Install ruby dependencies, DB clients and imagemagick
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
      postgresql-client-9.3 \
      imagemagick

# Set $PATH so that non-login shells will see the Ruby binaries
ENV PATH $PATH:/opt/rubies/ruby-1.9.3/bin

# Install MRI Ruby 1.9.3
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz && \
    tar -zxvf ruby-1.9.3-p551.tar.gz && \
    cd ruby-1.9.3-p551 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-1.9.3-p551 ruby-1.9.3-p551.tar.gz && \
    echo 'gem: --no-document' > /usr/local/etc/gemrc

# ==============================================================================
# Rubygems, Bundler and Foreman
# ==============================================================================

# Install rubygems and bundler
ADD http://production.cf.rubygems.org/rubygems/rubygems-2.3.0.tgz /tmp/
RUN cd /tmp && \
    tar -zxf /tmp/rubygems-2.3.0.tgz && \
    cd /tmp/rubygems-2.3.0 && \
    ruby setup.rb && \
    /bin/bash -l -c 'gem install bundler --no-rdoc --no-ri' && \
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Clean up APT and temporary files when done
RUN apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define working directory
WORKDIR /app

# Set bash as a default process
CMD ["bash"]
