FROM ubuntu:12.04
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN sed -i 's/precise main/precise main universe/' /etc/apt/sources.list
RUN apt-get update -yq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq python make g++ git
