
List all environment system:

```
Get-ChildItem Env:
```

List specifc environment, you need to use $
```
$Env:PATH
```


Set environment
1 - name of variable
2 - the content
3 - type permission

```
[Environment]::SetEnvironmentVariable("PATH", "C:\TestPath", "User")
```