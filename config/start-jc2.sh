#!/bin/bash
echo "starting just cause 2: multiplayer..."
cd ${STEAMCMD}/jc2mp-server
echo "renaming default_config.lua => config.lua..."
cp default_config.lua config.lua
echo "linking libstdc++..."
ln -s /steamcmd/linux32/libstdc++.so.6 libstdc++.so.6
echo "and finally starting server..."
./Jcmp-Server
