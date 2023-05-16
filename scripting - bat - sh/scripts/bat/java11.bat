@echo off
echo Setting JAVA_HOME
set JAVA_HOME "C:\Program Files\Java\jdk-11.0.15" /m
echo setting PATH
set Path "%JAVA_HOME%\bin;%Path%" /m
echo Display java version
java -version
