

baixando
```
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o cloudflared
chmod +x cloudflared
sudo mv cloudflared /usr/local/bin/
```

verificando instalacao
```
cloudflared --version
```

logando
```
cloudflared tunnel login
```

```
- vai abrir um navegador
- click no nameserver
- autorize
```

criando tunel
```
cloudflared tunnel create my-tunel-name
```
ao criar o tunel, 2 arquivos vão ser gerados nas configurações (um de certificado e outro de tunnel config)
em: /.cloudflared um deles vai ter o <UUID> essa chave vai ser usada em config.yml abaixo
é o seu identificador do tunnel

verificando
```
cloudflared tunnel list
```

crie o arquivo de configuração
```
/home/<USER>/.cloudflared/config.yml
```

edite o arquivo config.yml
```
tunnel: <UUID>
credentials-file: /home/<USER>/.cloudflared/<UUID>.json

ingress:
  - hostname: seu-dns.com.br
    service: http://localhost:3000
  - service: http_status:404

  #### subdominio ####
  # - hostname: seu-sub-dominio.seu-dns.com.br
  #   service: http://localhost:3000
  # - service: http_status:404
  ##################

  #### wildcard ####
  # deve ser configurado no painel da cloudFlare
  # CNAME,  * ,  <UUID>.domain.cloudflare.example
  ##################
  # dentro do dispacher do tunel nao especificar hostname
  # ingress:
  # - service: http://localhost:8080
  ##################
  # para o nginx de boarda fazer o switch por rule de subdomain ou path
  ##################
```
salve o arquivo com o UUID que foi gerado na pasta .cloudflare quando o tunel foi criado

```
cloudflared tunnel route dns <my-tunel-name> <seu-dns.com.br>
```
```
cloudflared tunnel run <my-tunel-name>
```

o processo é um pouco demorado
- indexação
- cache
- SSL
- routing
- dns
tenha paciencia, 
e analise os dados com calma logo seu tunel entre no ar
e seu sistema acessível

um detalhe importante, verifique
se sua aplicação está respondendo em 0.0.0.0:<porta>

para o simples: http.server
mapeamento para paths superiores como vc estava fazendo
não funcionaram, deixe o servidor no path presente dos arquivos,