#!/bin/bash
echo "starting starbound server..."
cd ${STEAMCMD}/starbound
echo "installing some dependencies..."
apt-get update && \
apt-get install -y libvorbisfile3
if [ -a ${CONFIG}/starbound_server.config ]
  then
    echo "copying starbound_server.config > "
fi
echo "and finally starting server..."
./starbound_server
