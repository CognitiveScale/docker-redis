# c12e/redis
# version: 2.8.17

FROM c12e/debian
MAINTAINER Indy Beck indy@c12e.com

ENV DEBIAN_FRONTEND noninteractive
RUN wget -q -O /tmp/redis-2.8.17.tar.gz http://download.redis.io/releases/redis-2.8.17.tar.gz
RUN tar -zxf /tmp/redis-2.8.17.tar.gz -C /opt

WORKDIR /opt/redis-2.8.17
RUN make
RUN mkdir -p /data/redis /logs/
ADD redis.conf /opt/redis-2.8.17/redis.conf

RUN apt-get update && apt-get -y install ruby2.1 ruby2.1-dev
RUN gem install redmon

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6379 4567
VOLUME ["/data", "/logs"]

CMD ["/usr/bin/supervisord"]
