#!/bin/bash

SCHEMA="/etc/freeradius/mods-config/sql/main/postgresql/schema.sql"
USERS="/etc/freeradius/mods-config/sql/main/postgresql/users.sql"

# Директория для БД точно должна быть доступна на запись
PG="psql -h postgres -U freeradius -d freeradius -v ON_ERROR_STOP=1"

# Схема, если ещё не загружали
if ! $PG -tAc "SELECT 1 FROM information_schema.tables WHERE table_name='radcheck'" | grep -q 1; then
  echo "[init] load FreeRADIUS schema (postgresql)"
  $PG -f $SCHEMA

  # Доп. таблицы/индексы, полезные для Simultaneous-Use
  $PG -c "CREATE TABLE IF NOT EXISTS nasreload (nasipaddress inet PRIMARY KEY, reloadtime timestamp);"
  $PG -c "CREATE UNIQUE INDEX IF NOT EXISTS radacct_unique ON radacct(acctuniqueid);"
  $PG -c "CREATE INDEX IF NOT EXISTS radacct_user_active ON radacct(username, acctstoptime);"

  # Демо-пользователи
  $PG -f $USERS
fi

echo "[run] starting FreeRADIUS..."

#tail -f /dev/null
freeradius -X
