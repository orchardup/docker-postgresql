docker-postgresql
=================

**Note:** There is now an [official Postgres image](https://registry.hub.docker.com/_/postgres/) available so this image is no longer maintained. We recommend you switch to using that image. You cannot configure its database name, username and password, but it does set up a user called `postgres` (no password) and a database called `postgres` which you can use instead.

PostgreSQL 9.3 for Docker.

    $ docker run -d -p 5432:5432 -e POSTGRESQL_USER=test -e POSTGRESQL_PASS=oe9jaacZLbR9pN -e POSTGRESQL_DB=test orchardup/postgresql
    da809981545f
    $ psql -h localhost -U test test
    Password for user test:
    psql (9.3.2, server 9.3.4)
    SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
    Type "help" for help.

    test=#

(Example assumes PostgreSQL client is installed on Docker host.)


## Environment variables

 - `POSTGRESQL_DB`: A database that is automatically created if it doesn't exist. Default: `docker`
 - `POSTGRESQL_USER`: A user to create that has access to the database specified by `POSTGRESQL_DB`. Default: `docker`
 - `POSTGRESQL_PASS`: The password for `POSTGRESQL_USER`. Default: `docker`



