# for vagrant
test -z $(which ansible-playbook) && sudo apt install -y ansible

# カーネルがアップグレードされた時の警告画面を表示しないようにする
ansible-playbook 00-needrestart.yml --connection=local

# update
sudo apt -y update
sudo apt -y upgrade

# 日本語化
sudo locale-gen ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:
sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE=ja_JP:

# タイムゾーンの変更
sudo timedatectl set-timezone Asia/Tokyo

# man ページの日本語化
sudo apt install -y manpages-ja manpages-ja-dev

# apt での表示の日本語化
sudo LANG=ja_JP.UTF-8 apt update

# mecab-ipadic-neologd のビルドに必要
sudo apt install -y build-essential

# ansible for wsl
sudo apt install -y ansible

# unzip (for laravel)
sudo apt install -y unzip

# curl
sudo apt install -y curl

# プロンプトを短く
sed -i s/\\\\u@\\\\h\\\\\\[\\\\033\\[00m\\\\\\]:\\\\\\[\\\\033\\[01\;34m\\\\\\]\\\\w/\\\\u@\\\\h\ \\\\[\\\\033[01\;34m\\\\]\\\\W\ / ~/.bashrc
sed -i s/\\\\u@\\\\h:\\\\w\\\\/\\\\u@\\\\h\ \\\\W\\\\\ / ~/.bashrc

# apache
ansible-playbook 01-apache.yml --connection=local

# MySQL
ansible-playbook 02-mysql.yml --connection=local

# PHP
ansible-playbook 03-php.yml --connection=local

# Laravel
ansible-playbook 04-laravel.yml --connection=local

# Mecab
ansible-playbook 05-mecab.yml --connection=local

# pyenv Anaconda
ansible-playbook 06-pyenv-anaconda.yml --connection=local

# MongoDB
ansible-playbook 07-mongo.yml --connection=local
