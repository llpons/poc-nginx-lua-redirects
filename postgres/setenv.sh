#!/bin/bash

[[ "${BASH_SOURCE[0]}" != "${0}" ]] || {
    echo "(x) Only executable as sourcing, e.g. source ${0}"
    exit 1
}

export PGUSER=lua
export PGPASSWORD=mysecret
export PGDATABASE=urldb
export PGHOST=localhost
export PGPORT=5432
