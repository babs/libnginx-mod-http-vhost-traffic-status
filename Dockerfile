FROM debian:buster

RUN set -xe \
  && /bin/echo -e "deb http://deb.debian.org/debian buster main contrib non-free\ndeb-src http://deb.debian.org/debian buster main contrib non-free\ndeb http://security.debian.org/debian-security buster/updates main\ndeb http://deb.debian.org/debian buster-updates main\n" > /etc/apt/sources.list \
  && apt-get update && apt-get dist-upgrade -y \
  && apt-get install -y git-core dpkg-dev

ADD Dockerfile /Dockerfile
ADD build.sh /build.sh

CMD [ "/build.sh" ]