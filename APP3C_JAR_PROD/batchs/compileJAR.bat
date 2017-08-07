@echo off

set HOME=.

set JAVA_SRC_HOME=%HOME%\src
set CLASSES_DIR=%HOME%\classes
set DIST_DIR=%HOME%\dist

cls
IF exist %CLASSES_DIR% (del "%CLASSES_DIR%\*" /S /Q) ELSE (mkdir %CLASSES_DIR%) 
IF exist %DIST_DIR% (del "%DIST_DIR%\*" /S /Q) ELSE (mkdir %DIST_DIR%)

::::::::::::::::
:: Java files ::
::::::::::::::::
@echo Compiling: ServiceLayer.java
javac -source 1.8 -target 1.8 -encoding utf8 "%JAVA_SRC_HOME%\com\tsoft\ap3c\service\ServiceLayer.java" -d "%CLASSES_DIR%"
if %ERRORLEVEL% GEQ 1 EXIT /B 1


::::::::::::
:: Build ::
::::::::::::
@echo Generating Jar file
"C:\Program Files\WinRAR\winrar.exe" a -afzip -ep1 -r -ibck "%DIST_DIR%\servicesLib.jar" "%CLASSES_DIR%\*.*"


::::::::::::::::::::
:: Non-Java files ::
::::::::::::::::::::
@echo Copying non-java files
copy resources "%DIST_DIR%"
