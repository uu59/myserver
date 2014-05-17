FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential curl vim
RUN apt-get install -y openssh-server
RUN sed -i '/UseDNS/d' /etc/ssh/sshd_config && echo UseDNS no >> /etc/ssh/sshd_config
RUN sed -i 's/^PermitRootLogin .*/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN mkdir -p /home/docker
RUN useradd docker
RUN chown -R docker /home/docker
RUN echo 'docker:docker' | chpasswd
RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get install -y python-apt

