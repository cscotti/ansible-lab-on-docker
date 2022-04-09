# Ansible + docker
video
<https://www.youtube.com/watch?v=yqLPUOsy-8M>
<https://devopssec.fr/article/creation-playbook-ansible-stack-lamp#begin-article-section><br>
<https://www.linkedin.com/pulse/configuring-haproxy-inside-docker-using-ansible-automation-tharak-ram>

## Start containers
```
docker-compose up --scale web=5 -d
```

## exec ansible container

```
docker-compose exec master bash
```

## Ansible commandes
```
# check if pod respond
root@master> ansible all -m ping -i /etc/ansible/hosts

# Apply playbook
root@master> ansible-playbook lamp.yml

# Connect to a lamp pod
root@master> ssh lamp_web_1
```

## reinit pods in order to test again the playbook
```
docker-compose up --scale web=0 -d
docker-compose up --scale web=5 -d
```


## remove all
```
docker-compose down
docker-compose rm
```

## Annexe
### remove volume
```
docker volume ls
docker volume rm <volume-name>
```
