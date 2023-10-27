
## Pratique:
```
https://labs.play-with-docker.com/
```

---

## Comandos básicos:

startando o serviço:
```
sudo service docker start
```

Logs of container:

```
$ docker logs --follow {container_name}
```


O comando de remoção do sistema do docker removerá todos os contêineres parados, 
todas as imagens pendentes e todas as redes não utilizadas:

```
$ docker system prune
```

lista containers:
```
$ docker ps -a
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
$ docker run -d --name <name_container> nome_da_imagem sleep infinity
```

Entrando no bash do container:
```
$ sudo docker exec -it {NOME} bash
```

Dando permissão para rodar com o usuario corretamente

```
$ sudo usermod -aG docker $USER
```

--- 

#### removendo imagens e containers

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

---


####cria um container temporário
```
docker run -it alpine:3.9
```

```
docker exec -it alpine:3.9 bash
```

---

#### copiando arquivos para dentro do container
```
docker cp /path_origin <container_name>:/<path_destiny>
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
