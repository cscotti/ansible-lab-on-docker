# Ansible + docker
video
<https://www.youtube.com/watch?v=yqLPUOsy-8M>
<https://devopssec.fr/article/creation-playbook-ansible-stack-lamp#begin-article-section><br>
<https://www.linkedin.com/pulse/configuring-haproxy-inside-docker-using-ansible-automation-tharak-ram>

## Start
```
docker-compose up --scale web=5 -d
docker-compose exec master bash
```

```
root@master> ansible all -m ping -i /etc/ansible/hosts
root@master> ansible-playbook lamp.yml

root@master> ssh lamp_web_1

```

test 



# reinit
```
docker-compose up --scale web=0 -d
docker-compose up --scale web=5 -d
```


ou 
```
docker-compose down
docker volume ls
docker volume rm <volume-name>
docker-compose up -d
```