FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget

ADD pgdg.list /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get -qq update && LC_ALL=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-8.4 libpq-dev

# /etc/ssl/private can't be accessed from within container for some reason
# (@andrewgodwin says it's something AUFS related)
RUN mkdir /etc/ssl/private-copy; mv /etc/ssl/private/* /etc/ssl/private-copy/; rm -r /etc/ssl/private; mv /etc/ssl/private-copy /etc/ssl/private; chmod -R 0700 /etc/ssl/private; chown -R postgres /etc/ssl/private

## Add over config files
ADD postgresql.conf /etc/postgresql/8.4/main/postgresql.conf
ADD pg_hba.conf /etc/postgresql/8.4/main/pg_hba.conf
RUN chown postgres:postgres /etc/postgresql/8.4/main/*.conf
ADD init-postgresql /usr/local/bin/init-postgresql
RUN chmod +x /usr/local/bin/init-postgresql

VOLUME ["/var/lib/postgresql"]
EXPOSE 5432

CMD ["/usr/local/bin/init-postgresql"]
