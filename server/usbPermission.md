
adicionando usuario no grupo dialout:
```
sudo usermod -a -G dialout jenkins
```

Dando permissão:
```
sudo chmod a+rw /dev/ttyACM0
```

verifique a permissão passando sua porta usb:
```
ls -la /dev/ttyACM0
```