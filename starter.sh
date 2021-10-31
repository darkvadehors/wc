#!/bin/sh

case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;;
  linux*)   echo "LINUX" ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

LAUNCHER="wc.sh"
TMP="/tmp/$LAUNCHER"
REMOTE_ADRESS="http://dev.johnben.fr/wc.sh"

if [[ "$OSTYPE" =~ ^darwin ]]; then
    curl -s $REMOTE_ADRESS -o $TMP
    sh $TMP
    rm $TMP
fi
