```
https://github.com/containers/podman
```

```
podman --version
```

```
podman machine init
```

```
podman machine start
```


listando containers
```
podman ps
```

listando imagens
```
podman images   
```

Pegando imagem do repositorio do docker 
```
podman pull docker.io/harisekhon/hbase:1.3
```

```
podman stop <container_name>
```

parando todas as imagens:
```
podman stop $(podman ps -q)
```


adicionando nano (por dentro do container):
```
 apk add nano
```

especificando arquivo:
```
podman-compose -f podman-compose.yml up -d
```

removendo todas as imagens
```
podman rm -a
```

---

```
podman rm -f $(podman ps -aq)
```
```
docker rmi -f $(docker images -aq)
```



