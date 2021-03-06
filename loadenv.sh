#!/bin/sh
export $(awk -F '=' '{ print $1 "=" (ENVIRON[$1] ? ENVIRON[$1] : $2) }' ./.env)

# line endings must be \n, not \r\n !
echo "window.env = {" > ./env-config.js
awk -F '=' '{ print $1 ": \"" (ENVIRON[$1] ? ENVIRON[$1] : $2) "\"," }' ./.env >> ./env-config.js
echo "}" >> ./env-config.js
