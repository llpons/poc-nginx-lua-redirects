# PoC for redirects with Nginx + Lua

There are 2 candidates for persistent storage.

## Lua Resty + Redis

https://openresty.org/en/lua-resty-redis-library.html

Seed redis:

```shell
redis-cli << EOF
SET /redis/test-foo /redis/ok
SET /redis/test-hello /redis/hello.html
EOF
```

Test with curl:

```shell
curl -IL localhost/redis/hello.html # 200
curl -IL localhost/redis/test-hello # 301 -> 200
curl -IL localhost/redis/test-foo # 301 -> 200
curl -IL localhost/redis/does-not-exist # 404
```

## Lua Resty + Postgres

https://leafo.net/guides/using-postgres-with-openresty.html
https://github.com/leafo/pgmoon

Database already seeded through 'postgres/initdb.d/initdb.sql'.

Test with curl:

```shell
curl -IL localhost/postgres/hello.html # 200
curl -IL localhost/postgres/test-hello # 301 -> 200
curl -IL localhost/postgres/test-foo # 301 -> 200
curl -IL localhost/postgres/does-not-exist # 404
```
