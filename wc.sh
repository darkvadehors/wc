#!/bin/zsh

# Version MAC et Linux
#clear screen
reset

echo "regular installation Mac"

# Regular Colors
COLOR_CYAN='\033[0;36m'
COLOR_BLACK='\033[0;30m'
COLOR_BLUE='\033[34m'
COLOR_GREEN='\033[92m'
COLOR_MAGENTA='\033[95m'
COLOR_PURPLE='\033[0;35m'
COLOR_RED='\033[0;31m'
COLOR_WHITE='\033[0;37m'
COLOR_YELLOW='\033[0;33m'
# Reset
COLOR_OFF='\033[0m'

# Root Path initialisation
WC_PATH=$PWD"/wc"

PYTHON_VERSION="-3.10.0-macos11"
PYTHON_FILE_NAME="python"$PYTHON_VERSION".pkg"
PYTHON_FILE_ABS_PATH=$WC_PATH/install/$PYTHON_FILE_NAME

CONDA_NAME="Anaconda3"
CONDA_VERSION="-2021.05-MacOSX-x86_64"
CONDA_FILE_NAME=$CONDA_NAME$CONDA_VERSION".sh"
CONDA_FILE_ABS_PATH=$WC_PATH/install/$CONDA_FILE_NAME


#chmod +x test.sh


echo "${COLOR_MAGENTA}  __          __${COLOR_BLUE}         _     _____ _        _   _"
echo "${COLOR_MAGENTA} \ \        / / ${COLOR_BLUE}       | |   / ____| |      | | (_)"
echo "${COLOR_MAGENTA}  \ \  /\  / /${COLOR_BLUE} __  _ __| | _| (___ | |_ __ _| |_ _  ___  _ __ "
echo "${COLOR_MAGENTA}   \ \/  \/ / ${COLOR_BLUE} _ \| '__| |/ /\___ \| __/ _' | __| |/ _ \| '_ \  "
echo "${COLOR_MAGENTA}    \  /\  /${COLOR_BLUE}  (_) | |  |   < ____) | || (_| | |_| | (_) | | | |"
echo "${COLOR_MAGENTA}     \/  \/${COLOR_BLUE}  \___/|_|  |_|\_\_____/ \__\__,_|\__|_|\___/|_| |_|"
echo "   ${COLOR_MAGENTA}   _____${COLOR_BLUE}             __ _                       _"
echo "   ${COLOR_MAGENTA} / ____|${COLOR_BLUE}           / _(_)                     | |"
echo "   ${COLOR_MAGENTA}| |${COLOR_BLUE}     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ ___  _ __"
echo "   ${COLOR_MAGENTA}| |${COLOR_BLUE}    / _ \| '_ \|  _| |/ _' | | | | '__/ _' | __/ _ \| '__|"
echo "   ${COLOR_MAGENTA}| |___${COLOR_BLUE}| (_) | | | | | | | (_| | |_| | | | (_| | || (_) | |"
echo "   ${COLOR_MAGENTA} \_____${COLOR_BLUE}\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__\___/|_|"
echo "                             __/ |"
echo "                            |___/            ${COLOR_BLACK}Par JohnBen.ch${COLOR_OFF} \n"
echo ""
echo "${COLOR_CYAN} ###########  ${COLOR_YELLOW}Bonjour ${COLOR_MAGENTA} ${COLOR_CYAN} ########### ${COLOR_OFF}\n"

cd ~

# Check download Folder
if  [-d "$WC_PATH"] ; then
    cd $WC_PATH
else
    echo "${COLOR_RED}Création du Répertoire${COLOR_OFF}"
    mkdir $WC_PATH"/install"
    cd $WC_PATH"/install"
    echo "Dossier WC créé - ${COLOR_GREEN}OK${COLOR_OFF} "
fi

# Check python install file
echo "Control du fichier ${COLOR_BLUE} ${STARTER_PY} ${COLOR_OFF}"

# Check Python
if [[ "$(python3 -V 2> /dev/null))" =~ "Python 3" ]]  ; then
    echo "${COLOR_GREEN}Python est déjà installé :-)${COLOR_OFF}"
else
    if [ -f "$PYTHON_FILE_NAME" ]; then
        echo "${COLOR_YELLOW} $PYTHON_FILE_NAME ${COLOR_GREEN}existe${COLOR_OFF}."
    else
        echo "Récupération de Python"
        curl -# -C - -o $PYTHON_FILE_ABS_PATH "https://www.python.org/ftp/python/3.10.0/${PYTHON_FILE_NAME}" && echo "Python récupéré - ${COLOR_GREEN}OK${COLOR_OFF}"
    fi
    sudo installer -verbose -pkg $PYTHON_FILE_ABS_PATH -target /
fi
# Check Anaconda
if [[ "$(conda -V 2> /dev/null)" =~ "conda 4" ]]  ; then
    echo "${COLOR_GREEN}Anaconda est déjà installé :-)${COLOR_OFF}"
else
    if [ -f "$CONDA_FILE_NAME" ]; then
        echo "${COLOR_YELLOW}$CONDA_FILE_NAME ${COLOR_GREEN}existe${COLOR_OFF}."
    else
        echo "Récupération de Anaconda"
        # curl -# -C - -o $CONDA_FILE_ABS_PATH "https://repo.anaconda.com/archive/${CONDA_FILE_NAME}" && echo "Anaconda récupéré - ${COLOR_GREEN}OK${COLOR_OFF}"
        curl -# -C - -o $CONDA_FILE_ABS_PATH "https://repo.anaconda.com/archive/${CONDA_FILE_NAME}" && echo "Anaconda récupéré - ${COLOR_GREEN}OK${COLOR_OFF}"
    fi

    # Create Opt directory
    if [ ! -d "$HOME/opt" ]; then
        mkdir $HOME/opt
    fi

    FOLDER_INSTALL=$HOME/opt

    #sh $CONDA_FILE_ABS_PATH -b -f -p ~/opt/$CONDA_NAME
    export PATH="$HOME/opt/$CONDA_NAME/bin:$PATH"

    # sudo installer -pkg $CONDA_FILE_ABS_PATH -target "${FOLDER_INSTALL}"
    # sudo installer -pkg $CONDA_FILE_ABS_PATH -target $FOLDER_INSTALL

fi

read -p "Installation de Base Terminé !"