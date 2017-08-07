@echo off

set HOME=.
set WEB-APP-FILES=%HOME%\WEB-APP
set JAVA_SRC_HOME=%HOME%\src
set CLASSES_DIR=%WEB-APP-FILES%\WEB-INF\classes
set LIB_DIR=%HOME%\lib

set SERVLET_JAR=C:\jars\lib\servlet-api.jar
set SERVICE_JAR="C:\Program Files\Jenkins\jobs\Aplicacion 3 capas - JAR\workspace\dist\servicesLib.jar"


cls
IF exist %CLASSES_DIR% (del "%CLASSES_DIR%\*" /S /Q) ELSE (mkdir %CLASSES_DIR%) 
IF exist %LIB_DIR% (del "%LIB_DIR%\*" /S /Q) ELSE (mkdir %LIB_DIR%)


::::::::::::::::
:: Java files ::
::::::::::::::::
@echo Compiling: FEServlet.java
javac -source 1.6 -target 1.6 -encoding utf8 -cp %SERVLET_JAR%;%SERVICE_JAR%;. "%JAVA_SRC_HOME%\com\tsoft\ap3c\frontend\FEServlet.java" -d "%CLASSES_DIR%"
if %ERRORLEVEL% GEQ 1 EXIT /B 1

::::::::::::
:: Build ::
::::::::::::
@echo Generating WAR file
@echo "C:\Program Files\WinRAR\winrar.exe" a -afzip -ep1 -r -ibck "%LIB_DIR%\ap3c.war" "%WEB-APP-FILES%\*.*"
"C:\Program Files\WinRAR\winrar.exe" a -afzip -ep1 -r -ibck "%LIB_DIR%\ap3c.war" "%WEB-APP-FILES%\*.*"
