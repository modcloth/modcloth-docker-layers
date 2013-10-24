PostgreSQL 9.3 container
========================

This container includes a PostgreSQL 9.3 installation with the default
cluster and configuration removed.  The expectation is that the new
cluster will be mounted as a volume at `/db` and may either be explicitly
initialized via `/pgbin/init` or will be initialized at the initial run
of the container via the default `CMD` of `["/pgbin/run", "--auto"]`.

As one might expect, port `5432` is exposed.

The following environmental variables may be used to alter the behavior of
`initdb` (via `/pgbin/init`) and `postgres` (via `/pgbin/run`):

- `PGLOCALE`: `--locale` option passed to `initdb` (default `C`)
- `PGENCODING`: `--encoding` option passed to `initdb` (default `UTF-8`)
- `PGAUTH`: `--auth` option passed to `initdb` (default `trust`)
- `PGNBUFFERS`: `-B` option passed to `postgres` (default `512MB`)
- `PGHOST`: `-h` option passed to `postgres` (default `0.0.0.0`)
- `PGMAXCONNECT`: `-N` option passed to `postgres` (default `100`)
- `PGPORT`: `-p` option passed to `postgres` (default `5432`)
- `PGWORKMEM`: `-S` option passed to `postgres` (default `8MB`)

## Example run

To run with all of the default params and auto-init the cluster, do something
like this:

``` bash
docker run -v /var/pgdata:/db -p 5432:5432 quay.io/modcloth/postgresql-93:latest
```
