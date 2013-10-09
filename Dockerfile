FROM ubuntu:12.04
MAINTAINER Ben Firshman "ben@orchardup.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-9.1 postgresql-contrib-9.1 postgresql-9.1-postgis libpq-dev

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private

ADD postgresql.conf /etc/postgresql/9.1/main/postgresql.conf
ADD pg_hba.conf /etc/postgresql/9.1/main/pg_hba.conf
ADD run /usr/local/bin/run

VOLUME ["/var/lib/postgresql"]
USER postgres
EXPOSE 5432
CMD ["/usr/local/bin/run"]

