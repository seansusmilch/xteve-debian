![](xTeVe_logo.PNG)

# xteve-debian Docker

A debian xTeVe container with streamlink!
Forked from [alturismo/xteve](https://github.com/alturismo/xteve)

- [xteve-debian Docker](#xteve-debian-docker)
  - [Environment Variables](#environment-variables)
  - [Docker compose](#docker-compose)
  - [Docker run](#docker-run)
  - [Using streamlink in xTeVe](#using-streamlink-in-xteve)


## Environment Variables

| Name | Description |
|---|---|
| TZ | Timezone (eg. America/Chicago)  |
| I_FFMPEG | if 1, install ffmpeg (default: 0) |
| I_STREAMLINK | if 1, install streamlink (default: 1) |


## Docker compose

```yaml
version: '3'

services:
  xteve:
    container_name: xteve-debian
    image: superminecraftkid64/xteve-debian
    ports:
      - 34400:34400
    environment:
      TZ: 'America/Chicago'
      I_FFMPEG: 0
      I_STREAMLINK: 1
    volumes:
      - .\mnt\config:/config
      - .\mnt\root:/root/.xteve
      - .\mnt\tmp:/tmp/xteve
```

## Docker run

```bash
docker run -d \
  --name=xteve \
  --net=host \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  -e TZ="Europe/Berlin" \
  -v /mnt/user/appdata/xteve/:/root/.xteve:rw \
  -v /mnt/user/appdata/xteve/_config:/config:rw \
  -v /tmp/xteve/:/tmp/xteve:rw \
  -v /mnt/user/appdata/tvheadend/data/:/TVH \
  superminecraftkid64/xteve
```

## Using streamlink in xTeVe

xTeVe doesn't officially support streamlink when connecting to streams, however theres a bit of a hacky way.

See this github discussion [here](https://github.com/streamlink/streamlink/discussions/3430#discussioncomment-234211)

Credits to those who developed xTeVe as well as **alturismo** who made the original container
