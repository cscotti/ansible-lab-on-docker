# Ansible Docker image (williamyeh/ansible:debian9 -> https://github.com/William-Yeh/docker-ansible/blob/master/debian9/Dockerfile)
FROM debian:bullseye

CMD ["bash"]
RUN /bin/sh -c echo "===> Installing python, sudo, and supporting tools..."  && \
  apt-get update -y  &&  apt-get install --fix-missing  && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  nano vim net-tools telnet \
  python3 python3-yaml sudo \
  curl gcc python3-pip python3-dev libffi-dev libssl-dev  && \
  apt-get -y --purge remove python3-cffi          && \
  pip3 install --upgrade pycrypto cffi pywinrm    && \
  echo "===> Installing Ansible..."   && \
  pip3 install ansible                 && \
  ansible-galaxy collection install community.general && \
  echo "===> Installing handy tools (not absolutely required)..."  &&  \
  apt-get install -y sshpass openssh-client  && \
  echo "===> Removing unused APT resources..."                  && \
  apt-get -f -y --auto-remove remove \     
  gcc python-pip python-dev libffi-dev libssl-dev  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*  /tmp/*                           && \
  echo "===> Adding hosts for convenience..."        && \
  mkdir -p /etc/ansible                              && \
  echo 'localhost' > /etc/ansible/hosts
CMD ["bash"]