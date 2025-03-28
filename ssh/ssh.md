# Metodo manual:

-----

### 1 - [cliente] Gerando chaves para se conectar com o servidor:

-------
Cliente - Gerando chave publica e privada:

```
ssh-keygen -t rsa -b 4096
```
t => tipo de chave

b => tamanho de bits

obs: procure gerar sempre uma chave com passphase, fica melhor protegida

-------

### 2 - [cliente] passando chave para o servidor :

exemplo:
```
ssh-copy-id -i id_rsa.pub mateusmed@192.168.0.19
```
-------

### 3 - [cliente] logando:
crie um arquivo "config"
```
touch config
```
adicione as configurações do seu servidor (indique sua chave -> RSA privada)
```
Host myserver
    HostName server_address
    User username
    IdentityFile ~/.ssh/id_rsa
```

### 4 - [cliente] logando:
```
ssh mateusmed@192.168.0.19
```
obs: agora será solicitado a passphase cadastrado (use a senha que vc configurou ao gerar a chave RSA)


### pronto ssh descomplicado
-------




### descrobrindo ip público:

```
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
echo "My WAN/Public IP address: ${myip}"
```

-- verificando quais portas estão sendo escutadas
```
sudo lsof -i -P -n | grep LISTEN
```

-------

### Possíveis erros:

port 22: Connection refused:
```
sudo apt-get remove openssh-client openssh-server
```
```
sudo apt-get install openssh-client openssh-server
```

