FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

# Essential stuffs
RUN apt-get install -y build-essential autoconf libtool software-properties-common python-software-properties

# Boost 1.55
RUN apt-get install -y libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-python-dev \
    libboost-regex-dev libboost-system-dev libboost-thread-dev

# Mapnik dependencies
RUN apt-get install --yes \
    libbz2-dev libxml2-dev \
    libjpeg-dev libtiff-dev libpng12-dev \
    libgdal1-dev libproj-dev libsqlite3-dev \
    libicu-dev libfreetype6-dev \
    libcairo2 libcairo2-dev libcairomm-1.0-1 libcairomm-1.0-dev \
    ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra \
    python-dev python-gdal python-nose python-cairo python-cairo-dev

# Mapnik
RUN apt-get install -y curl && \
    curl -s https://mapnik.s3.amazonaws.com/dist/v2.2.0/mapnik-v2.2.0.tar.bz2 | tar -xj -C /tmp/ && \
    cd /tmp/mapnik-v2.2.0 && \
    python scons/scons.py configure JOBS=4 INPUT_PLUGINS=all OPTIMIZATION=3 SYSTEM_FONTS=/usr/share/fonts/truetype/ && \
    make && make install JOBS=4 && ldconfig

RUN apt-get install -y gdal-bin mapnik-utils

# Node.js
RUN curl -sL https://deb.nodesource.com/setup | bash - && apt-get install -y nodejs

# Nginx
RUN echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list.d/nginx.list && \
    apt-key adv --fetch-keys "http://nginx.org/keys/nginx_signing.key" && \
    apt-get update && apt-get -y install nginx openssl ca-certificates

RUN rm -f /etc/nginx/conf.d/*
ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD index.html /usr/share/nginx/html/index.html

RUN npm -g install tilelive-tmsource tilelive-tmstyle tilelive-vector tessera

VOLUME ["/data]

ADD tessera-config.json /opt/tessera-config.json
ADD maastokartta_100k.tm2 /opt/maastokartta_100k.tm2
ADD maastokartta_100k.tm2source /opt/maastokartta_100k.tm2source
ADD start.sh /
RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
CMD []
