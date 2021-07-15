---
title: "Fedora 34: Running Docker and Docker Compose with Rootless Podman"
date: "2021-07-16"
tags: ["blog", "linux", "fedora", "containers", "docker", "docker-compose", "podman"]
type: post
permalink: /blog/fedora-34-running-docker-and-docker-compose-as-non-root-using-podman
---

## Prerequisites

```sh
sudo dnf install -y podman podman-docker docker-compose
```

## Start Podman

Define a function in `~/.zshrc` to make starting up `podman` easier:

```sh
function setup_podman() {
  export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
  systemctl --user enable --now podman.socket
  systemctl --user start podman.socket
  systemctl --user status podman.socket
  alias -g docker='podman'
}
```

**NB:** The commands are not prefixed with `sudo`.

Example run:

```sh
$ setup_podman
● podman.socket - Podman API Socket
     Loaded: loaded (/usr/lib/systemd/user/podman.socket; enabled; vendor preset: disabled)
     Active: active (listening) since Thu 2021-07-15 19:40:46 BST; 1h 9min ago
   Triggers: ● podman.service
       Docs: man:podman-system-service(1)
     Listen: /run/user/1000/podman/podman.sock (Stream)
     CGroup: /user.slice/user-1000.slice/user@1000.service/app.slice/podman.socket

Jul 15 19:40:46 mbana-pc-1 systemd[2339]: Listening on Podman API Socket.
$ which \docker
docker=podman
$ which docker
/usr/bin/podman
```

## Build an Image

```sh
mkdir /tmp/podman && cd /tmp/podman
cat <<EOF > /tmp/podman/Dockerfile
FROM docker.io/library/alpine:latest
ENTRYPOINT echo 'Podman built container.'
EOF
docker build --quiet --tag rootless-docker --no-cache .
docker run --rm --tty --interactive localhost/rootless-docker:latest
```

### Build Output

```sh
$ cat /tmp/podman/Dockerfile
FROM docker.io/library/alpine:latest
ENTRYPOINT echo 'Podman built container.'
$ docker images
REPOSITORY                 TAG         IMAGE ID      CREATED                 SIZE
localhost/rootless-docker  latest      800a95e3f0ae  Less than a second ago  5.87 MB
docker.io/library/alpine   latest      d4ff818577bc  4 weeks ago             5.87 MB
$ docker run --rm --tty --interactive localhost/rootless-docker
Podman built container.
```

## Run an Image

```sh
$ docker run --rm --tty --interactive docker.io/library/alpine:latest /bin/sh -c "echo 'Podman ran container.'"
Podman ran container.
```

## References

* [Use Docker Compose with Podman to Orchestrate Containers on Fedora](https://fedoramagazine.org/use-docker-compose-with-podman-to-orchestrate-containers-on-fedora).
