docker build . -t superminecraftkid64/xteve-streamlink
docker rm -f xteve-streamlink

@REM docker run -p 34400:34400 --name xteve-streamlink -v .\mnt\config:/config -v .\mnt\root:/root/.xteve -v .\mnt\tmp:/tmp/xteve -e TZ='America/Chicago' superminecraftkid64/xteve-streamlink
docker compose up