FROM quay.io/modcloth/postgresql-pgdg:latest
MAINTAINER Dan Buch <d.buch@modcloth.com>

RUN apt-get install -yq \
      postgresql-9.3 \
      postgresql-client-9.3 \
      postgresql-contrib-9.3 \
      libpq5 \
      libpq-dev
RUN /etc/init.d/postgresql stop ; \
    rm -rf /var/lib/postgresql/9.3/main \
           /etc/postgresql/9.3/main && \
    echo "export PATH=/usr/lib/postgresql/9.3/bin:$PATH" > /etc/profile.d/Z99-postgresql.sh && \
    chmod 0755 /etc/profile.d/Z99-postgresql.sh && \
    mkdir -p /db && \
    chown -R postgres:postgres /db ~postgres && \
    rm -f /var/run/postgresql/.s.PGSQL.5432.lock
ADD ./pgbin /pgbin

EXPOSE 5432
VOLUME ["/db"]
CMD ["/pgbin/run", "--auto"]
