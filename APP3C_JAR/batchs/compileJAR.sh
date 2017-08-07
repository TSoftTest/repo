HOME=.

JAVA_SRC_HOME=$HOME/src
CLASSES_DIR=$HOME/classes
DIST_DIR=$HOME/dist

clear
if [ -d "$CLASSES_DIR" ]; then
  rm -rf "$CLASSES_DIR/*"
else
  mkdir $CLASSES_DIR
fi
 
if [ -d "$DIST_DIR" ]; then
  rm -rf "$DIST_DIR/*"
else 
  mkdir $DIST_DIR
fi


echo Compiling: MessagePrinter.java
javac -source 1.8 -target 1.8 -encoding utf8 "$JAVA_SRC_HOME/com/tsoft/ap3c/service/ServiceLayer.java" -d "$CLASSES_DIR"

echo Generating Jar file
cd "$CLASSES_DIR" 
zip -r "../$DIST_DIR/servicesLib.jar" *
cd ..

echo Copying non-java files
cp resources/* "$DIST_DIR"