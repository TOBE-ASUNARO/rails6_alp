#!/bin/ash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails_app/tmp/pids/server.pid
# rails s -b ${BACKEND_HOST}

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"