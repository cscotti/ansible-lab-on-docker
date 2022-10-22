# Accelerate Ansible playbook testing with docker

# requirement
```
#build image
docker build -t ansible-master:latest -f Dockerfile . --network host
#check ansible image 
docker run --name ansible-master -it  ansible-master:latest /bin/bash -l

#check ubuntu image 
docker run --name myubuntu -it  ubuntu:20.10 /bin/bash -l
```

## Projects
- Lamp stacks - Mount multiple Lamp server with an Ha-proxy on docker
- (WIP) Nodejs - Mount multiple Nodesjs server with an Ha-proxy 
