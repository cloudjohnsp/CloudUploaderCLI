#!/bin/bash
BIN_DIR="/usr/local/bin"
UPLOADER_SCRIPT="clouduploader.sh"

if [ -f "$BIN_DIR/$UPLOADER_SCRIPT" ]; then
  echo "The script is already installed"
  exit 1
fi

cp $UPLOADER_SCRIPT $BIN_DIR

chmod +x $BIN_DIR/$UPLOADER_SCRIPT

if [[ ":$PATH:" == *":$BIN_DIR:"* ]]; then
	echo "Installation sucessful. Now you can call '$UPLOADER_SCRIPT' from CLI."
else 
	echo "Installation successful, but '$BIN_DIR' is not in PATH."
fi
