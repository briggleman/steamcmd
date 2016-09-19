#!/bin/bash
echo "starting steamcmd..."
./steamcmd.sh +runscript ${CONFIG}/${SCRIPT} && \
echo "done..."
echo "starting server via init script: ["${INIT}"]"
cd ${CONFIG}
./${INIT}
