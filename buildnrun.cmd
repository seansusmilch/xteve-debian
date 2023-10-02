docker build . -t superminecraftkid64/xteve-debian
docker rm -f xteve-debian

@REM docker run -p 34400:34400 --name xteve-debian -v .\mnt\config:/config -v .\mnt\root:/root/.xteve -v .\mnt\tmp:/tmp/xteve -e TZ='America/Chicago' superminecraftkid64/xteve-debian
docker compose up