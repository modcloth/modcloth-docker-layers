PostgreSQL 9.3 container
========================

This container includes a PostgreSQL 9.3 installation with the default
cluster and configuration removed.  The expectation is that the new
cluster will be mounted as a volume at `/pg/db` and may either be explicitly
initialized via `/pg/bin/init` or will be initialized at the initial run
of the container via the default `CMD` of `["/pg/bin/run", "--auto"]`.

As one might expect, port `5432` is exposed.

The following environmental variables may be used to alter the behavior of
`initdb` (via `/pg/bin/init`) and `postgres` (via `/pg/bin/run`):

- `PGLOCALE`: `--locale` option passed to `initdb` (default `C`)
- `PGENCODING`: `--encoding` option passed to `initdb` (default `UTF-8`)
- `PGAUTH`: `--auth` option passed to `initdb` (default `trust`)
- `PGNBUFFERS`: `-B` option passed to `postgres` (default `32MB`)
- `PGHOST`: `-h` option passed to `postgres` (default `0.0.0.0`)
- `PGMAXCONNECT`: `-N` option passed to `postgres` (default `100`)
- `PGPORT`: `-p` option passed to `postgres` (default `5432`)
- `PGWORKMEM`: `-S` option passed to `postgres` (default `8MB`)

## Example run

To run with all of the default params and auto-init the cluster, do something
like this:

``` bash
docker run -v /var/pgdata:/pg/db -p 5432:5432 quay.io/modcloth/postgresql-93:latest
```

## Auto-everything

As mentioned above, the default `CMD` is `["/pg/bin/run", "--auto"]`, which will
initialize a cluster in `/pg/db` based on the existence of
`/pg/db/postgresql.conf`.  Additional customization may be done by mounting a
volume at `/pg/custom` and providing an executable at `/pg/custom/first-run`.
If such file is present and executable, it will be run in a login shell for the
`postgres` user.

The `/pg/custom/first-run` executable is the ideal place to perform additional
customizations such as setting the password for the `postgres` user, creating
databases and users, etc., e.g.:

``` bash
#!/bin/bash
# /pg/custom/first-run
psql -c "CREATE ROLE fizzbuzz
         CREATEROLE NOSUPERUSER ENCRYPTED PASSWORD 'bazqwwx'"
psql -c "CREATE DATABASE fizzbuz ENCODING = 'UTF-8'"
```
