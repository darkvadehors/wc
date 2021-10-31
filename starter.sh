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
if [[ ! "$OSTYPE" =~ ^darwin ]]; then
    echo "     __   ___   ___ ___  ____  ____    ____       _____  ___    ___   ____"
    echo "    /  ] /   \ |   T   Tl    j|    \  /    T     / ___/ /   \  /   \ |    \ "
    echo "   /  / Y     Y| _   _ | |  T |  _  YY   __j    (   \_ Y     YY     Y|  _  Y"
    echo "  /  /  |  O  ||  \_/  | |  | |  |  ||  T  |     \__  T|  O  ||  O  ||  |  |"
    echo " /   \_ |     ||   |   | |  | |  |  ||  l_ |     /  \ ||     ||     ||  |  |"
    echo " \     |l     !|   |   | j  l |  |  ||     |     \    |l     !l     !|  |  |"
    echo "  \____j \___/ l___j___j|____jl__j__jl___,_j      \___j \___/  \___/ l__j__j"
    echo "System pas encore pris en charge."
fi


