FROM williamyeh/ansible:debian9

RUN apt-get update && apt-get install -y vim net-tools telnet curl