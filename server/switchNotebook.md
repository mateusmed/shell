

To disable entering the sleep mode I had to edit the /etc/systemd/logind.conf file 
and modify the line:

```
#HandleLidSwitch=suspend
```
to 

```
HandleLidSwitch=ignore
```

and check:

```
LidSwitchIgnoreInhibited=no
```

then do:

```
sudo service systemd-logind restart
```