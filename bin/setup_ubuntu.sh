#!/bin/bash

########################################
# パッケージ共通

# パッケージのアップデート
sudo apt-get -y update
# パッケージのアップグレード
sudo apt-get -y upgrade

########################################
# 必要なパッケージ

# Debian パッケージの構築に必須であるとされるパッケージ 
sudo apt-get -y install build-essential
# SQLite 3 開発用ファイル
sudo apt-get -y install libsqlite3-dev
# GNU readline および history ライブラリ - 開発用ファイル
sudo apt-get -y install libreadline6-dev
# GNU dbm データベースルーチン (開発用ファイル)
sudo apt-get -y install libgdbm-dev
# 圧縮ライブラリ - 開発キット
sudo apt-get -y install zlib1g-dev
# 高品質ブロックソートファイル圧縮ライブラリ - 開発用
sudo apt-get -y install libbz2-dev
# SQLite 3 用コマンドラインインターフェース
sudo apt-get -y install sqlite3
# Tcl および X11 用 Tk ツールキット - 開発用ファイル 
sudo apt-get -y install tk-dev # sever なら不要？
# .zip ファイル用のアーカイバ
sudo apt-get -y install zip
# 開発用 SSL ライブラリ、ヘッダおよびドキュメント
sudo apt-get -y install libssl-dev

########################################
# Python関連

# Header files and a static library for Python (v2.7)
sudo apt-get -y install python-dev

# pipのインストール
# wget https://bootstrap.pypa.io/get-pip.py
# sudo python get-pip.py

########################################
# ツール

# git
sudo apt-get -y install git
# シェル
sudo apt-get -y install zsh
# ctags
sudo apt-get -y install exuberant-ctags
