#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER postgres;
	CREATE DATABASE tenant_erp_testing;
	GRANT ALL PRIVILEGES ON DATABASE tenant_erp_testing TO postgres;
EOSQL

# psql -d tenant_erp_testing < /docker-entrypoint-initdb.d/erp_testing_dump