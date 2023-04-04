FROM ubuntu:22.04

LABEL maintainer="Roy van Dongen <roy@qonnect-it.nl>" \
      github="https://github.com/royvandongen/Icecast2-Docker"

ENV DEBIAN_FRONTEND noninteractive

#Install Packages
RUN apt-get -qq -y update;\
    apt-get -qq -y upgrade; \
    apt-get -qq -y install sudo icecast2; \
    apt-get -y autoclean; \
    apt-get clean; \
    chown -R icecast2 /etc/icecast2; \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2

ADD robots.txt /usr/share/icecast2/web/robots.txt

USER icecast2

CMD /usr/bin/icecast2 -c /etc/icecast2/icecast.xml

EXPOSE 8000
