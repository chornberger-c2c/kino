#!/bin/bash

DIR=/docker-entrypoint.d
if [[ -d "$DIR" ]]; then
  /bin/run-parts --verbose --regex ".*sh" "$DIR"
fi

exec "$@"
