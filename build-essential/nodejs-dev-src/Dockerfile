FROM dr.prod.modcloth.com/build-essential:0.1.0
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN curl -s http://nodejs.org/dist/v0.10.18/node-v0.10.18-linux-x64.tar.gz | tar xzf - --strip-components=1
RUN echo 'export PATH=/node-v0.10.18-linux-x64/bin:$PATH' > /etc/profile.d/node-v0.10.18.sh
