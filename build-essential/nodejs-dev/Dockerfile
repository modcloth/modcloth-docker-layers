FROM quay.io/modcloth/build-essential:latest
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN curl -s http://nodejs.org/dist/v0.10.18/node-v0.10.18-linux-x64.tar.gz | tar xzf - --strip-components=1
RUN echo 'export PATH=/node-v0.10.18-linux-x64/bin:$PATH' > /etc/profile.d/node-v0.10.18.sh
