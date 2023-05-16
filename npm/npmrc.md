
install
```
npm install -g npmrc
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


