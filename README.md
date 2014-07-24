# docker-postgresql-8.4

> PostgreSQL 8.4 for Docker.

```
$ docker build -t postgresql-8.4 .
<snip>

$ docker run -i -p 5432:5432 -e POSTGRESQL_USER=test -e POSTGRESQL_PASS=oe9jaacZLbR9pN -e POSTGRESQL_DB=test postgresql-8.4
2014-07-24 21:51:47 UTC LOG:  database system was shut down at 2014-07-24 21:51:47 UTC
2014-07-24 21:51:47 UTC LOG:  autovacuum launcher started
2014-07-24 21:51:47 UTC LOG:  database system is ready to accept connections

$ psql -h dev.banno.com -U test test
Password for user test:
psql (9.3.4, server 8.4.22)
Type "help" for help.

test=#
```

(Example assumes PostgreSQL client is installed on Docker host.)


## Environment variables

 - `POSTGRESQL_DB`: A database that is automatically created if it doesn't exist. Default: `docker`
 - `POSTGRESQL_USER`: A user to create that has access to the database specified by `POSTGRESQL_DB`. Default: `docker`
 - `POSTGRESQL_PASS`: The password for `POSTGRESQL_USER`. Default: `docker`
