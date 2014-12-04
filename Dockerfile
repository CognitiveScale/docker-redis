# c12e/redis
# version: 2.8.17

FROM c12e/debian
MAINTAINER Indy Beck indy@c12e.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install ruby2.1 ruby2.1-dev build-essential supervisor && \
 gem2.1 install redmon && \
 wget -q -O /tmp/redis-2.8.17.tar.gz http://download.redis.io/releases/redis-2.8.17.tar.gz && \
 tar -zxf /tmp/redis-2.8.17.tar.gz -C /opt && \
 cd /opt/redis-2.8.17 && \
 make && \
 mkdir -p /data/redis /logs/

ADD redis.conf /opt/redis-2.8.17/redis.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6379 4567
VOLUME ["/data", "/logs"]

CMD ["/usr/bin/supervisord"]
