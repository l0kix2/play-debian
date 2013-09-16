# packages
apt-get update
apt-get install -y build-essential debhelper dh-make mc vim git

# some debian defaults
cat >>/home/vagrant/.bashrc <<EOF
DEBEMAIL="johnny@ya.ru"
DEBFULLNAME="Johnny Appleseed"
export DEBEMAIL DEBFULLNAME
EOF

# useful functions
cat >>/home/vagrant/.bashrc <<EOF
source /vagrant/bash_functions/diff_fs.sh
EOF
