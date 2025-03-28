
create config file:
```
cd ~/.ssh
```

create file config
```
touch config
```

add on file config
```
Host <name host>
    Hostname <dns or ip>
    User <user name>
    IdentityFile ~/.ssh/id_rsa
```

connect direct
```
ssh <name_host>
```