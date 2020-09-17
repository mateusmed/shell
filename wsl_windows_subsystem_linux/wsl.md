Recursos do windows, habilitar:
    |_ vitualização
    |_ subsistema do windowns para linux 

Se tiver algum problema certifique-se que sua bios conf CPU está habilitada pra virtualização.

verificar versão no cmd:
```
wsl -l -v
```

```
wsl --set-version Ubuntu-20.04 2
```

```
wsl --set-default-version 2
```

open linux on dir windows 
```
explorer.exe .
```


If you need to install ubuntu image without microsoft store:
```
https://docs.microsoft.com/en-us/windows/wsl/install-manual
```
