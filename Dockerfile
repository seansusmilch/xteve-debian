FROM debian:stable-slim
RUN apt update && apt upgrade -y && \
    apt install -y ca-certificates

# Extras
RUN apt install -y curl unzip wget

# Timezone (TZ)
RUN apt install -y tzdata
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Volumes
VOLUME /config
VOLUME /root/.xteve
VOLUME /tmp/xteve

ENV SETUP_DONE=0
ENV I_FFMPEG=0
ENV I_STREAMLINK=1
COPY ./startup.sh /

# Add ffmpeg, vlc, streamlink
# RUN apt install -y --no-install-recommends streamlink
# RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc

# Add xTeve and guide2go
RUN wget https://github.com/xteve-project/xTeVe-Downloads/raw/master/xteve_linux_amd64.zip -O temp.zip && \
    unzip temp.zip -d /usr/bin/ && rm temp.zip

# Set executable permissions
RUN chmod +x /usr/bin/xteve

# Expose Port
EXPOSE 34400

# Entrypoint
# ENTRYPOINT ["xteve", "-port=34400", "-config=/root/.xteve/"]
ENTRYPOINT ["/startup.sh"]