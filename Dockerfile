# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM resin/rpi-raspbian:wheezy
MAINTAINER Hans Weggeman <hpweggeman@gmail.com>

# ------------------------------------------------------------------------------
# Install dependencies
 RUN apt-get update && sudo apt-get upgrade

# ------------------------------------------------------------------------------
# Install nodejs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    bzr \
    git \
    mercurial \
    openssh-client \
    subversion \
    procps \
    autoconf \
    automake \
    bzip2 \
    file \
    g++ \
    gcc \
    imagemagick \
    libbz2-dev \
    libc6-dev \
    libcurl4-openssl-dev \
    libevent-dev \
    libffi-dev \
    libgeoip-dev \
    libglib2.0-dev \
    libjpeg-dev \
    liblzma-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmysqlclient-dev \
    libncurses-dev \
    libpng-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    make \
    patch \
    xz-utils \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

#Unpack and install node
# ------------------------------------------------------------------------------
RUN cd /usr/local 
RUN wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-arm-pi.tar.gz 
RUN tar -xzvf node-v0.10.28-linux-arm-pi.tar.gz --strip=1 
RUN export NODE_PATH=”/usr/local/lib/node_modules”

CMD [ "node" ]

# ------------------------------------------------------------------------------
# Get cloud9 source and install
RUN git clone https://github.com/c9/core.git /tmp/c9
RUN cd /tmp/c9 && scripts/install-sdk.sh
RUN mv /tmp/c9 /cloud9
WORKDIR /cloud9

# ------------------------------------------------------------------------------
# Add workspace volumes
RUN mkdir /cloud9/workspace
VOLUME /cloud9/workspace

# ------------------------------------------------------------------------------
# Set default workspace dir
ENV C9_WORKSPACE /cloud9/workspace

# ------------------------------------------------------------------------------
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 8181
EXPOSE 3000