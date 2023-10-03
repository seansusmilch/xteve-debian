docker build . -t ghcr.io/seansusmilch/xteve-streamlink
docker rm -f xteve-streamlink

@REM docker run -p 34400:34400 --name xteve-streamlink -v .\mnt\config:/config -v .\mnt\root:/root/.xteve -v .\mnt\tmp:/tmp/xteve -e TZ='America/Chicago' ghcr.io/seansusmilch/xteve-streamlink
docker compose up