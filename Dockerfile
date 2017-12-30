FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

## Install tools
RUN apt-get update -qq && apt-get upgrade -y && \
    apt-get install -y net-tools openssh-server curl nano

## Configuration and key creation
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir ~/.ssh && chmod 700 ~/.ssh && \
    ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N "" && \
    cat ~/.ssh/id_rsa.pub | sed -e 's/^ *//' -e 's/ *$//' > ~/.ssh/authorized_keys && \
    chmod 600 ~/.ssh/authorized_keys && \
    echo "service ssh start" >/usr/sbin/entrypoint.sh && chmod 755 /usr/sbin/entrypoint.sh

WORKDIR /root

EXPOSE 22

ENTRYPOINT /usr/sbin/entrypoint.sh && bash
