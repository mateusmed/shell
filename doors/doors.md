
List port on linux:
```
nmap localhost
```
drop port:
```
fuser -k <port>/tcp
```

List port on windows:
```
netstat -ano | findstr :8080
```