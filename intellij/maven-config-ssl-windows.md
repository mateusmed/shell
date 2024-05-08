

Habilitando ssl maven intellij para usar os certificados do windows:

build, execution, deployment -> build tools -> maven -> runner

```
Delegate IDE build/run actions to maven  -> marcar como true
```
```
run in backgroud -> marcar como true
```
```
-Djavax.net.ssl.trustStoreType=Windows-ROOT
```

Mais opções para desabilitar a veriricação de ssl:
```
https://stackoverflow.com/questions/37698177/intellij-maven-repository-self-signed-certificate-ssl-error
```