#!/bin/sh

echo $INPUT_KEY > ssh_key.txt
chmod 600 ssh_key.txt

scp -i ssh_key.txt \
    -o StrictHostKeyChecking=no \
    -P $INPUT_PORT \
    -r $INPUT_REPO_DIR \
    "$INPUT_USER"@"$INPUT_HOST":"$INPUT_REMOTE_DIR"

shred -n 5 -u ssh_key.txt
