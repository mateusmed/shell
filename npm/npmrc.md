
install
```
npm install -g npmrc
```

Rode o comando no terminal
```
npmrc
```

Após instalar criará uma pasta no seu usuario

```
cd <usuario>/.npmrcs
```

Nessa pasta terá alguns arquivos de configurações:
```
<usuario>/.npmrcs
    |_ default
    |_ anotherConf
```


para listar as configurações que existem:

```
npmrc
```

você pode verificar qual artifactory está usando rodando o comando:

```
npm config get registry
```

Para usar as configurações que preicsar:
```
npmrc <default || anotherConf>
```

você verá algo como:
```
$ npmrc
Available npmrcs:

   anotherConf
 * default
```

caso não consiga acessar o npmrc, verifique qual versão do node vc está usando no "nvm"
o npmrc é instalado dentro do node, portanto verique, mude para a versão que tem instalado
para retornar para a configuração remota para o deafult

caso encontre um problema parecido com isso:

```
UNABLE_TO_VERIFY_LEAF_SIGNATURE
```

verifique sua vpn ou a senha gerada por seu artifactory

estrutura do arquivo npmrc:

```
registry=<url_seu_artifactory>

_auth=<token_autorizacao>
email=<email>
always-auth=true
strict-ssl=false
```