#//todo fill out what we are starting with
FROM accursoft/micro-debian:latest

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

# make a directory for our server scripts
RUN mkdir /config

# copy our killing floor 2 server file to /config
COPY kf2.config $CONFIG

# install dependencies
RUN apt-get update && \
    apt-get install -y lib32gcc1 curl bash && \
    apt-get clean

# download steamcmd and un-tar it
RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

# create a mount point for our config dir
VOLUME ${CONFIG}

# start steamcmd
CMD ["bash", "-c", "./steamcmd.sh +runscript $CONFIG/$SCRIPT"]
