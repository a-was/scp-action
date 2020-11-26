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
        remote_dir: '~/github/'
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
          repo_dir: 'dist/'
          # Remote directory path. Default home directory (~)
          remote_dir: '/home/user/github/'
```

# Changelog

## [v1.0.0] - 2020.11.26
- First release

# License

MIT, see LICENSE for more details
