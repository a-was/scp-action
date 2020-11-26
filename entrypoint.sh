#!/bin/sh

echo -e "${INPUT_KEY}" > key
chmod 600 key

scp -i key \
    -o StrictHostKeyChecking=no \
    -P "${INPUT_PORT}" \
    -r "${INPUT_SOURCE}" \
    "${INPUT_USER}"@"${INPUT_HOST}":"${INPUT_DESTINATION}"

# shred and delete key
shred -n 5 -u key
