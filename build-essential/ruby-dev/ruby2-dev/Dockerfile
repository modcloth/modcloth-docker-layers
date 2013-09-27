FROM dr.prod.modcloth.com/ruby-dev:0.1.0
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN apt-get install -yq ruby2.0 ruby-switch rubygems
RUN ruby-switch --set ruby2.0
RUN gem install bundler
