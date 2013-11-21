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
    mkdir -p /mysql/db /mysql/logs

ADD ./bin /mysql/bin
ADD ./hooks /mysql/hooks
ADD ./etc/my.cnf.example /mysql/config/

RUN chown -R mysql:mysql /mysql

EXPOSE 3306
VOLUME ["/mysql/db", "/mysql/logs"]
CMD ["/mysql/bin/run"]
