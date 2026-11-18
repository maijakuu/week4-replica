#!/bin/bash
set -Eeuo pipefail

timestamp=$(date -u +%Y%m%dT%H%M%SZ)
archive="website-${timestamp}.tar.gz"
destination="sitebackup@86.50.231.80"
key="/root/.ssh/sitebackup_ed25519"

trap 'echo "$(date -u -Is) FAILURE: $archive"' ERR

tar -C / -czf - \
  var/www/html \
  var/www/viikko1 \
  var/www/viikko2 \
  var/www/viikko3 |
  ssh -i "$key" -o IdentitiesOnly=yes -o BatchMode=yes \
    "$destination" \
    "umask 077; cat > backups/${archive}.partial && mv backups/${archive}.partial backups/${archive}"

echo "$(date -u -Is) SUCCESS: $archive"
