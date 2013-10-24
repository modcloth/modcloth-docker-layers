FROM quay.io/modcloth/postgresql-pgdg:latest
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN apt-get install -yq \
    postgresql-9.3 \
    postgresql-client-9.3 \
    postgresql-contrib-9.3
RUN /etc/init.d/postgresql stop ; \
    rm -rf /var/lib/postgresql/9.3/main \
           /etc/postgresql/9.3/main && \
    mkdir -p /db && \
    chown -R postgres:postgres /db ~postgres && \
    rm -f /var/run/postgresql/.s.PGSQL.5432.lock
ADD ./pgbin /pgbin

EXPOSE 5432
VOLUME ["/db"]
CMD ["/pgbin/run", "--auto"]
