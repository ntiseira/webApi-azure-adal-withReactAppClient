@echo off

SET CURRENT_DIR="%~dp0"

rem ****************************** input parameters ********************************

rem path al direcotrio base donde se va a alojar el sitio
SET IIS_DIR="%~1"

rem usuario de servicio y password
rem SET USR_SERVICIO=%~2
rem SET USR_SERVICIO_PWD=%~3

rem **************************** end input parameters ******************************


rem puertos del Middleware
SET FePort=3001
SET BePort=51590



rem directorios donde van a alojarse los sitios

SET FE_PATH=%IIS_DIR%\Orders\FE
SET BE_PATH=%IIS_DIR%\Orders\BE


if %IIS_DIR% == "" goto :missing_params
rem if [%USR_SERVICIO%] == [] goto :missing_params
rem if [%USR_SERVICIO_PWD%] == [] goto :missing_params

goto :continue

:missing_params
echo.
echo El script necesita el path al directorio base del IIS donde se van a alojar las aplicaciones
echo.
echo     Usage: iisdeploy path_to_iis_destination_directory  
exit /b 1

:continue

pushd %CURRENT_DIR%\Deploy

rem **********copia las aplicaciones al directiorio del iis**********
robocopy .\ %IIS_DIR% /e /xf iisdeploy.cmd

popd

pushd %systemroot%\system32\inetsrv

ECHO AppPool SETUP 
rem ***************************************************** apppool setup ************************************************

SET appcmd=CALL %WINDIR%\system32\inetsrv\appcmd

%appcmd% list apppool /name:"OrderAppPool"
IF "%ERRORLEVEL%" EQU "0" (
    ECHO YA EXISTE APP POOL "OrderAppPool"
    REM Add your bindings here
) ELSE (
   
   rem crea app pool para el BE
appcmd add apppool /name:OrderAppPool /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated /enable32bitapponwin64:true

appcmd set config /section:applicationPools /[name='OrderAppPool'].processModel.identityType:ApplicationPoolIdentity
)

rem *************************************************** end apppool setup **********************************************

rem ***************************************************** Sites setup ************************************************

ECHO SITES SETUP 

%appcmd% list sites /name:ApiOrders
IF "%ERRORLEVEL%" EQU "0" (
    ECHO YA EXISTE SITE ApiOrders
    REM Add your bindings here
) ELSE (


rem crea el sitio para el Be   
appcmd add site /name:ApiOrders /bindings:http/*:%BePort%: /physicalPath:%BE_PATH% 
appcmd set app ApiOrders/ /applicationPool:OrderAppPool
  
)


%appcmd% list sites /name:React-App
IF "%ERRORLEVEL%" EQU "0" (
    ECHO YA EXISTE SITE React-App
    REM Add your bindings here
) ELSE (


rem crea el sitio para el FE 
appcmd add site /name:React-App /bindings:http/*:%FePort%: /physicalPath:%FE_PATH% 
appcmd set app React-App/ /applicationPool:OrderAppPool
  
)

ECHO SET SECURITY

rem activa   anonymous authentication 
appcmd set config "React-App" /section:anonymousAuthentication /enabled:true /commit:apphost
rem activa   anonymous authentication 
appcmd set config "ApiOrders" /section:anonymousAuthentication /enabled:true /commit:apphost


ECHO INSTALACION APP COMPLETADA CON EXITO     
)


rem *************************************************** end sites setup **********************************************

