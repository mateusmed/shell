
---

Definição
```
Para capturar valor de atributos de um json text, que possívelmente  
foi formatado errado:
```

Regex
```
/([\: ]\"[\w ]*\"[\w ]*\"[\w ]*\")/gm
```

Exemplo input:
```
{"atr": "ok", "atr2": "value whith" teste32 "another" value with another" test "}
```

Dado capturado:
```
 "value whith" teste32 "another"
```

---
