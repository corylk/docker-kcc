# docker-kcc

[Kindle Comic Converter](https://github.com/ciromattia/kcc) is a Python app to convert comic/manga files or folders to EPUB, Panel View MOBI or E-Ink optimized CBZ.

This docker image runs KCC GUI with VNC.

# Usage

## Environment

There are no required environment variables, however the optional variables you may witsh to set are:

| Variable | Description | Default |
| - | - | - |
| `NO_DECOR` | Disable window decor | unset |
| `GIT_REPO` | URL of repo | https://github.com/ciromattia/kcc) |
| `GIT_BRANCH` | Name of branch | `master` |

## Ports

| Port | Description |
| - | - |
| `8080` | HTTP port on which VNC is exposed |

## Volumes

| Volume | Description |
| - | - |
| `/config` | Home directory and path to app config |

## Examples

### docker-compose

```yml
services:
  kcc:
    image: ckleinsc/kcc
    container_name: kcc
    environment:
      - NO_DECOR=1
      - REPO_GIT=https://github.com/ciromattia/kcc
      - KCC_VERSION=master
    volumes:
      - /path/to/config:/config
    ports:
      - 8080:8080
    restart: unless-stopped
```
