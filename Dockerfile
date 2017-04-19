FROM debian:stretch
MAINTAINER idk <problemsolver@openmailbox.org>

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y apt-transport-https wget curl gnupg2 apt-utils dpkg-sig reprepro

RUN echo "deb https://cmotc.github.io/apt-now/debian rolling main" | tee /etc/apt/sources.list.d/cmotc.github.io.list
RUN wget -qO - https://cmotc.github.io/apt-now/cmotc.github.io.gpg.key | apt-key add -

RUN apt-get update
RUN apt-get install -y apt-now pkpage scpage mini-httpd

CMD [mini-httpd]