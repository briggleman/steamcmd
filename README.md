steamcmd in Docker
===

This repository provides everything you need to run steamcmd in Docker.

For convenience it also contains a Killing Floor 2 server file.

Why?
---
The main hurdle of running steamcmd in Docker is that steamcmd supports
multiple servers.
Compared to other steamcmd docker images, this one exposes a `volume` named
`config` as well as an `environment` variable to tell steamcmd which server file
to use. This means:

* One container can be used to run multiple servers
* Server scripts can be created externally and mounted into the container

Run
---

```bash
docker run -p 7777:7777 -p 27015:27015 -p 8080:8080 -p 20560:20560 ghetto/steamcmd:latest
```

```bash
docker run -p 7777:7777 -p 27015:27015 -p 8080:8080 -p 20560:20560 -v /myscripts:/config -e SCRIPT=kf2.config ghetto/steamcmd:latest
```

Volumes
---

* `/config` => Directory containing server scripts

Ports
---

* 7777 => game port
* 27015 => query port
* 8080 => web admin (KF2 specific)
* 20560 => steam

Environment Variables
---

* SCRIPT => kf2.config (default server file to use when launching steamcmd)

In the box
---
* **ghetto/steamcmd**

  The docker image with steamcmd. Built from the `accursoft/micro-debian`
  Debian micro image.

Public Builds
---

https://registry.hub.docker.com/u/ghetto/steamcmd/


Build from Source
---

    docker build -t ghetto/steamcmd .

Notes
---

* Additional ports can be mapped as required by using the `-p` flag.

Todo
---

* Add more documentation
