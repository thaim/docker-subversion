FROM ubuntu:14.04
MAINTAINER thaim <thaim24@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        subversion apache2 libapache2-svn \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
    && mkdir /var/svn

COPY svn.conf /etc/apache2/conf-enabled/
COPY entrypoint.sh /entrypoint.sh

VOLUME ["/var/svn"]
WORKDIR /var/svn

ENTRYPOINT ["/entrypoint.sh"]
