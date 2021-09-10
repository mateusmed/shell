============ docker image tomcat7 ============

pull image:
```
$ docker pull tomcat
```

para ver as tags acesse:
```
https://hub.docker.com/_/tomcat
```

build container:

```
$ sudo docker run --name {container_name} -p {local_your_machine}:8080 {tag_of_image}
```
```
$ sudo docker run --name tomcat-server -p 9292:8080 tomcat:7
```

Stop container:

```
$ sudo docker stop tomcat-server
```

Start container:

```
$ sudo docker start tomcat-server
```

copy files to container:
```
$ sudo docker cp {arquivo} {container_name}:{pathContainer}
```
exemplo:

```
$ sudo docker cp '/pathLocal/arquivo.war' meucontainer:'/pathContainer/'
```

o tomcat vai restartar sozinho.


Para ver os logs:
```
$ docker logs --follow tomcat-server
```
