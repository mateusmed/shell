
 - -B - linha acima a palavra achada
 - -A - linhas abaixo da palavra achada
```
less catalina.log | grep -B 1 -A 1 '<keyword>'
```

Captura toda linha da ocorrência
```
less catalina.log | grep -n '<keyword>'
```
