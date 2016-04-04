#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install git virtualbox vagrant -y
  vagrant plugin install vagrant-hostsupdater

  sudo apt-get install php5-mysql php5 php5-memcached memcached -y

  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer

  composer global require drush/drush:dev-master
  sudo ln -s $HOME/.composer/vendor/bin/drush /usr/local/bin/drush

  echo "Install Complete, check using the drush command in step 3."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask

  brew cask install virtualbox
  brew cask install vagrant
  vagrant plugin install vagrant-hostsupdater

  brew install homebrew/php/php56-memcached
  brew install mysql

  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer

  composer global require drush/drush:dev-master
  ln -s $HOME/.composer/vendor/bin/drush /usr/local/bin/drush

  echo "Install Complete, check using the drush command in step 3."
else
  echo "Your OS is not currently supported. If you have a suggestion as to how to implement it, please submit a pull request."
fi
