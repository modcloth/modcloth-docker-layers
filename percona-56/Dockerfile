FROM quay.io/modcloth/percona-apt-repo:latest
MAINTAINER Platform <platform@modcloth.com>

RUN apt-get install -yq \
    percona-server-server-5.6 \
    percona-server-client-5.6 \
    percona-toolkit \
    percona-xtrabackup
RUN /etc/init.d/mysql stop ; \
    usermod -d /mysql mysql && \
    rm -rf /etc/mysql /var/lib/mysql && \
    mkdir -p /mysql/db /mysql/custom && \
    chown -R mysql:mysql /mysql ~mysql

ADD ./bin /mysql/bin
ADD ./etc/my.cnf.example /mysql/db/my.cnf

RUN chown -R mysql:mysql /mysql && chmod 0640 /mysql/db/my.cnf

EXPOSE 3306
VOLUME ["/mysql/db", "/mysql/custom"]
CMD ["/mysql/bin/run"]
