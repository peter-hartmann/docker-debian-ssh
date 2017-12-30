debian-ssh
===========

[![Docker Stars](https://img.shields.io/docker/stars/peterhartmann/docker-ssh.svg)](https://hub.docker.com/r/peterhartmann/docker-ssh/)
[![Docker Pulls](https://img.shields.io/docker/pulls/peterhartmann/docker-ssh.svg)](https://hub.docker.com/r/peterhartmann/docker-ssh/)


For development only.

Don't use it in a product environment.

# Usage

    git clone https://github.com/peter-hartmann/docker-debian-ssh.git
    docker build -t peterhartmann/debian-ssh docker-debian-ssh/
    docker run -it --rm --name ssh --volumes-from wiki -e TZ=America/Chicago peterhartmann/debian-ssh
    docker run -dt --restart=always --name ssh --volumes-from wiki -e TZ=America/Chicago peterhartmann/debian-ssh
    docker exec -it ssh bash

getting the public key out
    docker cp wiki_ssh:/root/.ssh/id_rsa ~/.ssh/wiki_rsa && eval $(ssh-agent) && ssh-add ~/.ssh/wiki_rsa
    ssh-keygen -f "~/.ssh/known_hosts" -R wiki_rsa && ssh ssh

# Detail

## MySQL
* user: root
* (No password)

## SSH
SSH is not supported. Use `docker exec` to enter the docker container.
