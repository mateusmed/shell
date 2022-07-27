

install typescript
```
npm i -g typescript
```

tsc version
```
tsc -v
```

init tsc file
```
tsc --init
```

inside of tsconfig.json
/* Specify an output folder for all emitted files. */
example:
``` 
"outDir": "./compile/js", 
```

inside of tsconfig.json
/* Specify the root folder within your source files. */
example:
```
"rootDir": "./src",                                  
```

compile
```
tsc 
```

compile automatic when happend changes, list errors in realTime
```
tsc -w
```


install ts-node-dev
```
npm install -D ts-node-dev
```

add this command on you script package.json, example:

```
"scripts": {
    "dev": "ts-node-dev --respawn --transpile-only --exit-child --no-notify src/index.ts",
  },
```


you can run application like:
```
npm run dev
```


