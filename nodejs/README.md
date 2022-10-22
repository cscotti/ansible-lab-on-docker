# Run nodejs environment into Docker with HaProxy

## Build containers
```
$ docker-compose build
```
## Start containers
```
$ docker-compose up --scale web=5 -d

nodejs_db_1 is up-to-date
nodejs_web_1 is up-to-date
Recreating nodejs_lb_1 ... 
nodejs_master_1 is up-to-date
nodejs_web_2 is up-to-date
nodejs_web_3 is up-to-date
nodejs_web_4 is up-to-date
Recreating nodejs_lb_1 ... done
```

## Connect to the Ansible master container

```
docker-compose exec master bash
```

## Ansible commands
```

# check ansible version
root@master> ansible --version

# check if pod respond
root@master> ansible all -m ping -i /etc/ansible/hosts

# Apply playbook
root@master> ansible-playbook main.yml

# Connect to a nodejs pod
root@master> ssh nodejs_web_1

# test web service with the lb (HaProxy)
curl nodejs_lb_1:5000

<html>
    <head>
        <title>Welcome to nodejs_web_5 !</title>
    </head>
    <body>
        <h1>Success! The nodejs_web_5 virtual host is working!</h1>
    </body>
</html>
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

# Ressources
video
<https://www.youtube.com/watch?v=yqLPUOsy-8M><br>
<https://devopssec.fr/article/creation-playbook-ansible-stack-nodejs#begin-article-section><br>
<https://www.linkedin.com/pulse/configuring-haproxy-inside-docker-using-ansible-automation-tharak-ram>


# Annexe
### remove volume
```
docker volume ls
docker volume rm <volume-name>
```
