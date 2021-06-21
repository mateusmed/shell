Notebook server

lista as placas de rede:
```
ifconfig -s
```

mudando ip temporariamente:
```
sudo ifconfig enp0s8 192.168.0.x
```


Adicionando um ip estático, Altere o arquivo dentro do diretorio:
```
cd /etc/netplan
```

Adicione o código para um ip statico dentro de uma rede privada, substitua o nome da placa de rede:
```
network:
  version: 2
  renderer: NetworkManager
  ethernets:
      <PLACA_REDE>:
         dhcp4: no
         addresses: [192.168.0.x/24]
         gateway4: 192.168.0.1
         nameservers:
            addresses: [192.168.0.1,8.8.8.8]
```