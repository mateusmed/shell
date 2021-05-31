
List all environment system:

```
Get-ChildItem Env:
```

List specifc environment, you need to use $

JAVA_HOME:
```
($env:JAVA_HOME).split(";")
```

PATH:
```
($env:PATH).split(";")
```


Add java_home in path

```
setx JAVA_HOME "C:\Program Files\Java\jdk1.7.0_79" /m
```

```
setx PATH "%PATH%;%JAVA_HOME%" /m
```


Set environment
1 - name of variable
2 - the content

Add bin java on path

```
[Environment]::SetEnvironmentVariable("PATH", "C:\Program Files\Java\jdk1.7.0_79\bin")
```

Add permanently configs maked in this terminal
```
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)
```

```
https://techexpert.tips/pt-br/powershell-pt-br/powershell-editar-a-variavel-ambiente-path/
```
