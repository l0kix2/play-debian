# packages
apt-get update
apt-get install -y build-essential debhelper dh-make mc

# some debian defaults
cat >>/home/vagrant/.bashrc <<EOF
DEBEMAIL="sibirev@yandex-team.ru"
DEBFULLNAME="Kirill Sibirev"
export DEBEMAIL DEBFULLNAME
EOF

# useful functions
cat >>/home/vagrant/.bashrc <<EOF
source /vagrant/bash_functions/diff_fs.sh
EOF
