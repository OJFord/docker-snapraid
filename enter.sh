#!/bin/sh
set -e

# Expects mounts at /mnt/{data,parity}/* and /var/snapraid.
# Provides len(/mnt/parity/*) parity for the /mnt/data/* mounts.
# Stores snapraid content lists on parity disks & /var.

echo content /var/snapraid/snapraid.content >> /etc/snapraid.conf

i=1
for d in /mnt/parity/*; do
    parity="$(if [ $i -gt 1 ]; then printf %s- $i; fi)parity"
    echo "$parity $d/snapraid.parity" >> /etc/snapraid.conf
    echo "content $d/snapraid.content" >> /etc/snapraid.conf
    i=$((i + 1))
done

i=1
for d in /mnt/data/*; do
    echo "data $i $d" >> /etc/snapraid.conf
    i=$((i + 1))
done

echo nohidden >> /etc/snapraid.conf
exec "$@"
