#!/bin/bash
if [ "$USERNAME" != "anonymous" ]
  then
    echo "swapping in username/password..."
    sed -i.bak 's/<USERNAME> <PASSWORD>/'"$USERNAME $PASSWORD"'/g' ${CONFIG}/${SCRIPT}
fi
echo "starting steamcmd..."
./steamcmd.sh +runscript ${CONFIG}/${SCRIPT} && \
echo "done..."
echo "starting server via init script: ["${INIT}"]"
cd ${CONFIG}
./${INIT}
