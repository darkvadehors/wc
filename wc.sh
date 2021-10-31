#!/bin/sh

# Version MAC et Linux
#clear screen
reset

echo "regular installation Mac"

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

# Root Path initialisation
WC_PATH=$PWD"/wc"

PYTHON_VERSION="-3.10.0-macos11"
PYTHON_FILE_NAME="python"$PYTHON_VERSION".pkg"
PYTHON_FILE_ABS_PATH=$WC_PATH/install/$PYTHON_FILE_NAME

CONDA_VERSION="-2021.05-MacOSX-x86_64"
CONDA_FILE_NAME="Anaconda3"$CONDA_VERSION".sh"
CONDA_FILE_ABS_PATH=$WC_PATH/install/$CONDA_FILE_NAME

#chmod +x test.sh


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
if test -d "$WC_PATH" ; then
    cd $WC_PATH
else
    echo "${RED}Création du Répertoire${COLOR_OFF}"
    mkdir $WC_PATH"/install"
    cd $WC_PATH"/install"
    echo "Dossier WC créé - ${GREEN}OK${COLOR_OFF} "
fi

# Check python install file
echo "Control du fichier ${BLUE} ${STARTER_PY} ${COLOR_OFF}"

# Check Python
if [[ "$(python3 -V 2> /dev/null))" =~ "Python 3" ]]  ; then
    echo "${GREEN}Python est déjà installé :-)${COLOR_OFF}"
else
    if test -f "$PYTHON_FILE_NAME" ; then
        echo "${GREEN} $PYTHON_FILE_NAME ${RED}existe${COLOR_OFF}."
    else
        echo "Récupération de Python"
        curl -# -C - -o $PYTHON_FILE_ABS_PATH "https://www.python.org/ftp/python/3.10.0/${PYTHON_FILE_NAME}" && echo "Python récupéré - ${GREEN}OK${COLOR_OFF}"
    fi
    sudo installer -verbose -pkg $PYTHON_FILE_ABS_PATH -target /
fi

# Check Anaconda
if [[ "$(conda -V 2> /dev/null)" =~ "conda 4" ]]  ; then
    echo "${GREEN}Anaconda est déjà installé :-)${COLOR_OFF}"
else
    if test -f "$CONDA_FILE_NAME" ; then
        echo "${GREEN} $CONDA_FILE_NAME ${RED}existe${COLOR_OFF}."
    else
        echo "Récupération de Anaconda"
        curl -# -C - -o $CONDA_FILE_ABS_PATH "https://repo.anaconda.com/archive/${CONDA_FILE_NAME}" && echo "Anaconda récupéré - ${GREEN}OK${COLOR_OFF}"
    fi
    # sudo installer -verbose -pkg $CONDA_FILE_ABS_PATH -target ~
    sh $CONDA_FILE_ABS_PATH
fi




#tar xvzf Python-2.7.3.tgz

#conda create --name wc flask
#conda activate wc
#Echo Conda OK

#!/usr/bin/env python

#chmod +x test.py

#python3 test.py

