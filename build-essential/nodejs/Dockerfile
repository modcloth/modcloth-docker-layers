FROM dr.prod.modcloth.com/build-essential:0.1.0
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN apt-get install -yq python-software-properties python g++ make
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update -yq
RUN apt-get install -yq rlwrap
RUN apt-get install -yq nodejs
