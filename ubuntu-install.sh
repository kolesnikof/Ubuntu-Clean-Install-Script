echo "#-----------------------------------------------------------------------#"
echo "update aptitude"
echo "#-----------------------------------------------------------------------#"
sudo apt-get update
echo "#-----------------------------------------------------------------------#"
echo "Install Web Services"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install lamp-server^ php5-gd openssh-server vsftpd lynx nodejs
sudo a2enmod rewrite
sudo pecl install uploadprogress
sudo service apache2 restart
echo "#-----------------------------------------------------------------------#"
echo "Install Version Control"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install subversion git cvs
echo "#-----------------------------------------------------------------------#"
echo "Install Other Applications"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install aptitude exuberant-ctags curl gparted synergy 
echo "#-----------------------------------------------------------------------#"
echo "Install Python3 and Django with Apache and MySQL modules and SQLite3"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install python3 libapache2-mod-python python-mysqldb python-django sqlite3 python-gtkmvc python-gtkmvc-doc
echo "#-----------------------------------------------------------------------#"
echo "Install Ruby and Rails"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install ruby rubygems rails
sudo gem install mysql2
echo "#-----------------------------------------------------------------------#"
echo "Install Haskell with dependencies"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install libgmp3-dev freeglut3 freeglut3-dev
sudo apt-get -y --force-yes install ghc-ghci
echo "#-----------------------------------------------------------------------#"
echo "Install Applications that usually aren't found"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install filezilla emma wireshark tshark chromium-browser compizconfig-settings-manager
sudo apt-get -y --force-yes install php-pear
sudo pear upgrade
sudo pear channel-discover pear.drush.org
sudo pear install drush/drush
sudo drush
sudo add-apt-repository ppa:myunity/ppa
sudo apt-get update
sudo apt-get install myunity
echo "#-----------------------------------------------------------------------#"
echo "Mactel Support PPA"
echo "#-----------------------------------------------------------------------#"
sudo add-apt-repository ppa:mactel-support/ppa
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair
echo "#-----------------------------------------------------------------------#"
echo "configure vim"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install build-essential vim vim-gnome ruby ruby-dev
cd ~/
git clone git://github.com/mimiflynn/Ubuntu-.vim-for-development.git .vim
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc
cd .vim
vim -c 'so %' -c 'q' command-t-1.2.1.vba &
sleep 10
cd ruby/command-t
ruby extconf.rb
make
reset
echo "#-----------------------------------------------------------------------#"
echo "Create sites directory and clone git repos"
echo "#-----------------------------------------------------------------------#"
cd
mkdir Sites
cd Sites
git clone ~/Dropbox/git/wordpress.git/
git clone ~/Dropbox/git/ad7-mf.git/
git clone ~/Dropbox/git/ruby.git/
git clone ~/Dropbox/git/single-page.git/
git clone ~/Dropbox/git/black-monolith.git/
cd /var/www
sudo ln -s ~/Sites/wordpress
sudo ln -s ~/Sites/ad7-mf
sudo ln -s ~/Sites/ruby
sudo ln -s ~/Sites/single-page
sudo ln -s ~/Sites/black-monolith
echo "#-----------------------------------------------------------------------#"
echo "install git-ftp"
echo "#-----------------------------------------------------------------------#"
cd git clone https://github.com/resmo/git-ftp.git
cd git-ftp
git checkout master
sudo make install

sudo add-apt-repository ppa:resmo/git-ftp
sudo aptitude update
sudo apt-get install git-ftp
echo "#-----------------------------------------------------------------------#"
echo "office and graphics suites"
echo "#-----------------------------------------------------------------------#"
sudo apt-get -y --force-yes install libreoffice gimp inkscape
echo "#-----------------------------------------------------------------------#"
echo "delete unnecessary whatnot"
echo "#-----------------------------------------------------------------------#"
sudo apt-get autoremove
echo "#-----------------------------------------------------------------------#"
echo "Install finished"
echo "You will need to review your Apache2 and PHP configurations as follows:"
echo "add 'extension=uploadprogress.so' to /etc/php5/apache2/php.ini"
echo "change www directory to 'allow all' in /etc/apache2/sites-enabled/default"
echo "#-----------------------------------------------------------------------#"
