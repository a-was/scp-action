# SCP Action

Secure copy files from repo to remote server

# Usage

## Simple

```yaml
scp-files-job:
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v2
    - uses: a-was/scp-action@v1
      with:
        host: ${{ secrets.REMOTE_HOST }}
        user: ${{ secrets.REMOTE_USER }}
        key: ${{ secrets.SSH_PRIVATE_KEY }}
        destination: '~/github/'
```

## Full

`.github/workflows/scp.yaml`

```yaml
name: SCP Files Action

on:
  push:
    branches: [ master ]

jobs:
  scp-files-job:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: a-was/scp-action@v1
        with:
          # Remote host
          host: ${{ secrets.REMOTE_HOST }}
          # Remote host SSH port. Default 22
          port: 2222
          # Remote host user
          user: ${{ secrets.REMOTE_HOST }}
          # SSH private key
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          # Repo directory path. Default whole repo (.)
          source: 'dist/'
          # Remote directory path. Default home directory (~)
          destination: '/home/user/github/'
```

# How `source` and `destination` works:

Default action will copy whole repo, so if you have repo called `project` you will have `project/` directory on remote server with all files.


If you want to copy whole repo, but also remote directory named differently than repo name, you have to set `source` to `"$(pwd)/*"`, and `destination` to your directory path ex. `/home/user/myProject/`.
On remote server you will have `myProject` directory with `project` repo content.
```yaml
source: "$(pwd)/*"
destination: /home/user/myProject/
```
Note that `./*` won't work!


If you want to copy only one repo directory with its name, ex. `myFiles/`, you can set `source` to `myFiles/`. On remote server you will have `myFiles/` directory with its content.


If you want to copy files from specific directory, ex. `dist/`, you can set `source` to `dist/*`. On remote server you will have your files in specified in `destination` directory.

Ex. some website project
```yaml
source: dist/*
destination: /var/www/
```

# Changelog

## [v1.0.0] - 2020.11.26
- First release

# License

MIT, see LICENSE for more details
