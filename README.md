# docker-kcc

[Kindle Comic Converter](https://github.com/ciromattia/kcc) is a Python app to convert comic/manga files or folders to EPUB, Panel View MOBI or E-Ink optimized CBZ.

This docker image runs the latest version of KCC GUI with VNC for remote access.

# Usage

## Environment

There are no required environment variables, however the optional variables you may wish to set are:

| Variable | Description | Default |
| - | - | - |
| `GIT_REPO` | URL of repo | https://github.com/ciromattia/kcc |
| `GIT_BRANCH` | Name of branch | `master` |

Also see the (mostly VNC-related) [options for the base image](https://github.com/linuxserver/docker-baseimage-kasmvnc?tab=readme-ov-file#options).

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
      - GIT_REPO=https://github.com/ciromattia/kcc
      - GIT_BRANCH=master
    volumes:
      - /path/to/config:/config
    ports:
      - 8080:8080
    restart: unless-stopped
```
