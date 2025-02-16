#! /usr/bin/bash

VENV_DIR="venv"
REQUIREMENTS="requirements.txt"

#Download dataset
source scripts/data_download.sh

if [ -d $VENV_DIR ] && [ -f "$VENV_DIR/bin/activate" ]
then
    echo "Venv already exists."
    exit 0
fi

echo "Venv not found! Creating..."
#Create and activate venv
python3 -m venv $VENV_DIR
source $VENV_DIR/bin/activate
pip install --upgrade pip

#Download needed libraries from the list
if [ -f "requirements.txt" ]
then
    pip install -r requirements.txt
else    
    echo "No requirements.txt found
    exit 1
fi

