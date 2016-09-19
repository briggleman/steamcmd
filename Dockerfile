MAINTAINER ben.riggleman@gmail.com

# start with latest alpine edge
FROM apline:edge

# environment variables
ENV STEAMCMD /steamcmd
ENV PATH $STEAMCMD:$PATH
ENV CONFIG /config
ENV PATH $CONFIG:$PATH
ENV SCRIPT kf2.config

# ports
# 7777 => game port, 27015 => query port, 8080 => web admin, 20560 => steam
EXPOSE 7777 27015 8080 20560

# set our working directory to steamcmd
WORKDIR /steamcmd

# copy our killing floor 2 server file to /config
COPY kf2.config $CONFIG

# install dependencies
RUN apk --add --update libstdc++ bash

# download steamcmd and un-tar it
RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

# create a mount point for our scripts dir
VOLUME ${SCRIPTS}

# start steamcmd
CMD ['steamcmd', ${SCRIPT}]
