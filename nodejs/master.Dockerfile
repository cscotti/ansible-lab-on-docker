FROM ansible-master:latest

RUN apt-get update && apt-get install -y vim net-tools telnet curl