
docker pull mysql/mysql-server:latest

podman pull docker.io/mysql/mysql-server:latest

================= Mysql docker image =================

```
$docker run -p 3307:3306 --name {NOME} -e MYSQL_ROOT_PASSWORD={PASSWORD} -d mysql
```

```
$docker run p 3307:3306 --name mysql-ctn -e MYSQL_ROOT_PASSWORD=root -d mysql
```

=========================================

```
podman run -p 3307:3306 --name mysql-ctn -e MYSQL_ROOT_PASSWORD=root -d mysql-server
```
```
docker exec -it mysql-ctn bash
```

logando dentro do container:
```
mysql -u root -p -A
```

permitindo acesso externo (configurando mysql)
```
select user, host from mysql.user;
```
```
update mysql.user set host='%' where user='root';
```
```
flush privileges;
```

Antes:
```
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| root             | localhost |
| healthchecker    | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
+------------------+-----------+
```

depois:
```
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| root             | %         |
| healthchecker    | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
+------------------+-----------+
```
