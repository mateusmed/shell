Recursos do windows, habilitar:
    |_ vitualização
    |_ subsistema do windowns para linux 

Se tiver algum problema certifique-se que sua bios conf CPU está habilitada pra virtualização.

instalação no link:
```
https://docs.microsoft.com/pt-br/windows/wsl/about
```

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


Caso tenha algum problema com SNAP no WSL2, execute:
```
sudo apt-get update && sudo apt-get install -yqq daemonize dbus-user-session fontconfig
```
```
sudo daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
```
```
exec sudo nsenter -t $(pidof systemd) -a su - $LOGNAME
```


agradeça à : https://github.com/sunliusi