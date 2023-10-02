#!/bin/bash

SETUP_DONE_FILE="/setup_done"

function setup_container () {
    installList=""
    echo "installing ffmpeg = $I_FFMPEG    streamlink = $I_STREAMLINK"
    if [ $I_FFMPEG = 1 ]; then
        installList="$installList ffmpeg"
    fi
    if [ $I_STREAMLINK = 1 ]; then
        installList="$installList streamlink"
    fi
    apt install -y --no-install-recommends $installList &> /config/apt.log

    echo "Completing setup"
    echo "1" > $SETUP_DONE_FILE
}

if [ -f "$SETUP_DONE_FILE" ]; then
    echo "$SETUP_DONE_FILE exists. Skipping setup"
else
    setup_container
fi

xteve -port=34400 -config=/root/.xteve/

exit