

Add certificate on jdk
```
keytool -import -noprompt -trustcacerts -alias <ALIAS_NAME> -file "<PATH_FILE.CER>" -keystore "C:\Program Files\Java\jdk1.8.0_202\jre\lib\security\cacerts" -storepass changeit
```
