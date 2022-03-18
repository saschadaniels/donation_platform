#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

rake db:migrate
bundle exec rails webpacker:install 
bundle exec rails webpacker:compile

export SECRET_KEY_BASE=$(rails secret)
exec bundle exec "$@"

