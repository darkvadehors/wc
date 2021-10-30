#!/bin/sh

# Version MAC et Linux
#clear screen
reset

echo "regular installation Mac/Linux"

# Regular Colors
CYAN='\033[0;36m'
BLACK='\033[0;30m'
BLUE='\033[34m'
GREEN='\033[92m'
MAGENTA='\033[95m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
WHITE='\033[0;37m'
YELLOW='\033[0;33m'
# Reset
COLOR_OFF='\033[0m'

PYTHON_VERSION="-3.10.0-macos11"
PYTHON_FILE_NAME="python"$PYTHON_VERSION".pkg"
PYTHON_FILE_ABS_PATH=$START_PATH/wc/$PYTHON_FILE_NAME

CONDA_VERSION="-2021.05-MacOSX-x86_64"
CONDA_FILE_NAME="Anaconda3"$CONDA_VERSION".sh"
CONDA_FILE_ABS_PATH==$START_PATH/wc/$CONDA_FILE_NAME

# Root Path initialisation
START_PATH=$PWD

#chmod +x test.sh
#$ABS_PATH = $PWD


echo "${MAGENTA}  __          __${BLUE}         _     _____ _        _   _"
echo "${MAGENTA} \ \        / / ${BLUE}       | |   / ____| |      | | (_)"
echo "${MAGENTA}  \ \  /\  / /${BLUE} __  _ __| | _| (___ | |_ __ _| |_ _  ___  _ __ "
echo "${MAGENTA}   \ \/  \/ / ${BLUE} _ \| '__| |/ /\___ \| __/ _' | __| |/ _ \| '_ \  "
echo "${MAGENTA}    \  /\  /${BLUE}  (_) | |  |   < ____) | || (_| | |_| | (_) | | | |"
echo "${MAGENTA}     \/  \/${BLUE}  \___/|_|  |_|\_\_____/ \__\__,_|\__|_|\___/|_| |_|"
echo "   ${MAGENTA}   _____${BLUE}             __ _                       _"
echo "   ${MAGENTA} / ____|${BLUE}           / _(_)                     | |"
echo "   ${MAGENTA}| |${BLUE}     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ ___  _ __"
echo "   ${MAGENTA}| |${BLUE}    / _ \| '_ \|  _| |/ _' | | | | '__/ _' | __/ _ \| '__|"
echo "   ${MAGENTA}| |___${BLUE}| (_) | | | | | | | (_| | |_| | | | (_| | || (_) | |"
echo "   ${MAGENTA} \_____${BLUE}\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__\___/|_|"
echo "                             __/ |"
echo "                            |___/            ${BLACK}Par JohnBen.ch${COLOR_OFF} \n"
echo ""
echo "${CYAN} ###########  ${YELLOW}Bonjour ${MAGENTA} ${CYAN} ########### ${COLOR_OFF}\n"

cd ~

# Check download Folder
if test -d "$START_PATH/wc" ; then
    cd $START_PATH/wc
else
    echo "${RED}Création du Répertoire${COLOR_OFF}"
    mkdir $START_PATH/wc
    cd $START_PATH/wc
    echo "Dossier WC créé - ${GREEN}OK${COLOR_OFF} "
fi

# Check python install file
echo "Control du fichier ${BLUE} ${STARTER_PY} ${COLOR_OFF}"

if test -f "$FILE" ; then
    echo "${GREEN} $FILE ${RED}existe${COLOR_OFF}."
else
    # Check Python
    if [[ "$(python3 -V)" =~ "Python 3" ]]  ; then
        echo "${GREEN}Python est déjà installé :-)${COLOR_OFF}"
    else
        echo "Récupération de Python"
        curl -# -C - -o $PYTHON_FILE_NAME "https://www.python.org/ftp/python/3.10.0/${PYTHON_FILE_NAME}" && echo "Python récupéré - ${GREEN}OK${COLOR_OFF}" && sudo installer -pkg $PYTHON_FILE_NAME -target /
    fi

    # Chesk Conda Version
    if [[ "$(conda -V)" =~ "Anaconda 3" ]] ; then
        echo "${GREEN}Anaconda est déjà installé :-)${COLOR_OFF}"
    else
        echo "Récupération de Anaconda"
        curl -# -C - -o $CONDA_FILE_NAME "https://repo.anaconda.com/archive/${CONDA_FILE_NAME}" && echo "Anaconda récupéré - ${GREEN}OK${COLOR_OFF}" && sudo installer -pkg $CONDA_FILE_NAME -target /
    fi

fi

#tar xvzf Python-2.7.3.tgz

#conda create --name wc flask
#conda activate wc
#Echo Conda OK

#!/usr/bin/env python

#chmod +x test.py

#python3 test.py

