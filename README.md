docker-postgresql
=================

PostgreSQL for Docker.

    $ docker run -d -p 5432:5432 -e POSTGRESQL_USER=test -e POSTGRESQL_PASS=oe9jaacZLbR9pN orchardup/postgresql
    da809981545f
    $ createdb -h localhost -U test test
    Password for user test:
    $ psql -h localhost -U test test
    Password for user test:
    psql (9.1.9, server 9.1.3)
    Type "help" for help.

    test=#



