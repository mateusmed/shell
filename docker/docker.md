
pratice:
```
https://labs.play-with-docker.com/
```



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

Logs of container:

```
$ docker logs --follow {container_name}
```

```
$ docker logs --follow tomcat-server
```

==============================================


=============== docker commands ================        
O comando de remoção do sistema do docker removerá todos os contêineres parados, 
todas as imagens pendentes e todas as redes não utilizadas:

```
$ docker system prune
```

lista containers:
```
$ docker ps
```

lista imagens:
```
$ docker images
```

remove imagem pelo ID:
```
$ docker rmi ID_ou_nome_da_imagem
```

rodando a imagem:
```
$ docker run nome_da_imagem
```

================= redis docker image  =================
$ docker run --name {NOME} -d redis
$ docker run --name redis-ctn -d redis

========================================
================= Mysql docker image =================
$docker run --name {NOME} -e MYSQL_ROOT_PASSWORD={PASSWORD} -d mysql
$docker run --name mysql-ctn -e MYSQL_ROOT_PASSWORD=root -d mysql
=========================================

Entrando no bash do container:
```
$ sudo docker exec -it {NOME} bash
```

Dando permissão para rodar com o usuario corretamente

```
$ sudo usermod -aG docker $USER
```
=====================================

O comando de remoção do sistema do docker removerá todos os contêineres parados,
todas as imagens pendentes e todas as redes não utilizadas:

```
$ docker system prune
```

listando containers
```
docker container list
```

obtem informações sobre o container
```
docker inspect <id_container>
```

cria um container temporário
```
docker run -it alpine:3.9
```

```
docker exec -it alpine:3.9 bash
```



## Imagens

listando imagens:
```
docker image list
```
ou
```
docker images
```

remove imagem pelo ID:
```
$ docker rmi ID_ou_nome_da_imagem
```

rodando a imagem:
```
$ docker run nome_da_imagem
```

---



## Rede
criando rede:
```
docker network create --driver bridge minha-rede
```

listando network
```
docker network ls
```

Hostname
```
hostname
```

verificando ip
```
hostname -i
```

---
