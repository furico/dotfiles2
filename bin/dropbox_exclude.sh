#!/bin/bash

# Dropboxyから同期するディレクトリを除外するスクリプト
DROPBOX_PY="${HOME}/Dropbox/dropbox.py"
if [ ! -f ${DROPBOX_PY} ]; then
  echo "not found ${DROPBOX_PY}"
  exit 1
fi

paths="${HOME}/*"
for path in ${paths}; do
  if [ -d $path ]; then
    echo $path
  fi
done
