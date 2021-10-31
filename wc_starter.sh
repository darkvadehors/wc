#!/bin/sh

LAUNCHER="wc_install.sh"
TMP="/tmp/$LAUNCHER"
REMOTE_ADRESS="https://raw.githubusercontent.com/darkvadehors/wc/main/$LAUNCHER"

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    alias ls='ls --color=auto'
    ;;
  'FreeBSD')
    OS='FreeBSD'
    alias ls='ls -G'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin')
    OS='Mac'
    curl -s $REMOTE_ADRESS -o $TMP && sh $TMP && rm $TMP
    ;;
  'SunOS')
    OS='Solaris'
    ;;
  'AIX') ;;
  *) ;;
esac



if [[ ! $OS =~ "Mac" ]]; then
    echo "     __   ___   ___ ___  ____  ____    ____       _____  ___    ___   ____"
    echo "    /  ] /   \ |   T   Tl    j|    \  /    T     / ___/ /   \  /   \ |    \ "
    echo "   /  / Y     Y| _   _ | |  T |  _  YY   __j    (   \_ Y     YY     Y|  _  Y"
    echo "  /  /  |  O  ||  \_/  | |  | |  |  ||  T  |     \__  T|  O  ||  O  ||  |  |"
    echo " /   \_ |     ||   |   | |  | |  |  ||  l_ |     /  \ ||     ||     ||  |  |"
    echo " \     |l     !|   |   | j  l |  |  ||     |     \    |l     !l     !|  |  |"
    echo "  \____j \___/ l___j___j|____jl__j__jl___,_j      \___j \___/  \___/ l__j__j"
    echo "System pas encore pris en charge."
fi


