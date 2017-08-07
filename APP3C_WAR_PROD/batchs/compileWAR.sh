HOME=.
WEB_APP_FILES=$HOME/WEB-APP
JAVA_SRC_HOME=$HOME/src
CLASSES_DIR=$WEB_APP_FILES/WEB-INF/classes
LIB_DIR=$HOME/lib


SERVLET_JAR=/home/serena/Downloads/apache-tomcat-7.0.65/lib/servlet-api.jar
SERVICE_JAR="/home/serena/.jenkins/jobs/App-3capas-JAR/workspace/dist/servicesLib.jar"

clear
if [ -d "$CLASSES_DIR" ]; then
  echo borrando contenido de $CLASSES_DIR
  rm -rf "$CLASSES_DIR/*"
else
  echo Creando carpeta $CLASSES_DIR
  mkdir $CLASSES_DIR
fi

if [ -d "$LIB_DIR" ]; then
  echo borrando contenido de $LIB_DIR 
  rm -rf "$LIB_DIR/*"
else
  echo Creando carpeta $LIB_DIR
  mkdir $LIB_DIR
fi

echo Compiling FEServlet.java
javac -source 1.6 -target 1.6 -encoding utf8 -cp "$SERVLET_JAR:$SERVICE_JAR:." "$JAVA_SRC_HOME/com/tsoft/ap3c/frontend/FEServlet.java" -d "$CLASSES_DIR"

echo Generating WAR file
cd "$WEB_APP_FILES/"
zip "../$LIB_DIR/ap3c.war" *
cd ..

