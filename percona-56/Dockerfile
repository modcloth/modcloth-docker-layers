FROM quay.io/modcloth/percona-apt-repo:latest
MAINTAINER Platform <platform@modcloth.com>

ENV SKIP_START_REPLICATION_FOR_MASTER "yes"
ENV SKIP_START_REPLICATION_FOR_SLAVE "yes"
ENV SKIP_DEFAULT_FIRST_RUN "yes"

RUN apt-get update -yq
RUN apt-get install -yq \
    percona-server-server-5.6 \
    percona-server-client-5.6 \
    percona-toolkit \
    percona-xtrabackup
RUN /etc/init.d/mysql stop ; \
    usermod -d /mysql mysql && \
    rm -rf /etc/mysql /var/lib/mysql
RUN for dir in db logs bin hooks config ; do \
  mkdir -p "/mysql/$dir" ; \
  done

ADD ./bin /mysql/bin
ADD ./hooks /mysql/hooks

RUN chown -R mysql:mysql /mysql

EXPOSE 3306
VOLUME ["/mysql/db", "/mysql/logs"]
CMD ["/mysql/bin/run"]
