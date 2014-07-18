#!/usr/bin/env bash

# From Creating a Vagrant Box


cat << EOF | sudo tee -a /etc/motd.tail
***************************************

Welcome to Trusty64 Vagrant Box

***************************************
EOF

sudo apt-get update -y

# Vim

sudo apt-get -y install vim 

sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev \
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
python-software-properties postgresql libpq-dev

# Ruby rbenv
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.2
rbenv global 2.1.2

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Rails

sudo apt-get -y install nodejs
gem install rails
rbenv rehash
gem install bundler
mkdir /home/vagrant/code



echo "You've been provisioned"
