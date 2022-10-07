#!/bin/env sh
# authinfo - select a authinfo entry
# by philip k. <https://zge.us.to/>, 2018-
# in the public domain
# dependencies: awk, gpg2

OPTS=$(echo "$@" | awk 'BEGIN { RS = " "; FS = "=" }
length > 1 { sub(/[[:space:]]*$/, ""); printf("-v %s=%s ", tolower($1), $2) }')
if [ -z "$OPTS" ]; then
	  printf "usage:\t%s FIELD=VALUE ...\n" "$(basename $0)" 2> /dev/stderr
	  printf "fields:\tLOGIN MACHINE PORT\n" 2> /dev/stderr
	  exit 0
fi

gpg -q -d "${AUTHINFO_FILE:-$HOME/.authinfo.gpg}" | awk $OPTS '
BEGIN { FS=" " } !$0 { next }
{ delete record; for (i = 1; i < NF; i += 2) record[$i] = $(i+1) }
(!(login && ("login" in record)) || record["login"] ~ login) &&
(!(machine && ("machine" in record)) || record["machine"] ~ machine) &&
(!(port && ("port" in record)) || record["port"] ~ port) &&
record["password"] { print record["password"] }'
