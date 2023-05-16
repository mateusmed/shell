@echo off
cls
@echo.
@echo    ****************************************************************************
@echo    ***                                                                      ***
@echo    ***    desenvolvido por Mateus Medeiros - 2023   			    ***
@echo    ***    linkedin: https://www.linkedin.com/in/mateus-medeiros-14a038164/  ***
@echo    ***                                         			            ***
@echo    ****************************************************************************
@echo.


@echo off

set ARTIFACTORY_REGISTRY=<URL_ARTIFACTORY>
set ARTIFACTORY_USER=<USER>
set ARTIFACTORY_PASSWORD=<PASSWORD>
set ARTIFACTORY_EMAIL=<EMAIL>

npm config set registry %ARTIFACTORY_REGISTRY%
npm adduser --registry=%ARTIFACTORY_REGISTRY% --always-auth=true <<EOF
%ARTIFACTORY_USER%
%ARTIFACTORY_PASSWORD%
%ARTIFACTORY_EMAIL%
EOF


timeout 1

@echo    ****************************************************************************
@echo    *** Registry configurado com sucesso
@echo    ****************************************************************************

pause
