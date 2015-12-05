#!/bin/bash

# Dropboxyから同期するディレクトリを除外するスクリプト

DROPBOX_DIR="${HOME}/Dropbox"
DROPBOX_PY="${DROPBOX_DIR}/dropbox.py"

if [ ! -f ${DROPBOX_PY} ]; then
  echo "not found ${DROPBOX_PY}"
  exit 1
fi

db_paths="${DROPBOX_DIR}/*"
for db_path in ${db_paths}; do
  if [ -d ${db_path} ]; then
    python ${DROPBOX_PY} exclude add ${db_path}
  fi
done

RIV_VIM="${DROPBOX_DIR}/riv_vim"
python ${DROPBOX_PY} exclude remove ${RIV_VIM}
