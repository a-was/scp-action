#!/bin/sh

echo -e "${INPUT_KEY}" > key
chmod 600 key

scp -v \
    -i key \
    -o StrictHostKeyChecking=no \
    -P "${INPUT_PORT}" \
    -r "${INPUT_REPO_DIR}" \
    "${INPUT_USER}"@"${INPUT_HOST}":"${INPUT_REMOTE_DIR}"

# shred and delete key
shred -n 5 -u key
