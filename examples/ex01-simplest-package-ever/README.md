Preparation
-----------
```
mkdir ~/batman-0.1.0 && cd batman-0.1.0
```

dh_make man: http://manpages.ubuntu.com/manpages/karmic/man8/dh_make.8.html  
`--native` native package, not quilt.  
`--single` package will generate a single binary .deb package  
```
dh_make --native --single
```

Removing all examples and other uninteresting files
```
rm -rf *.{ex,EX} README* docs
```

```
cd debian
```

Changelog info: http://www.debian.org/doc/debian-policy/ch-source.html#s-dpkgchangelog
```
cat changelog
```

http://www.debian.org/doc/manuals/maint-guide/dother.en.html#compat
debhelper compatibility level
```
cat compat
```

Control file info: http://www.debian.org/doc/debian-policy/ch-controlfields.html
```
vim control
```
Section: http://www.debian.org/doc/debian-policy/ch-archive.html#s-subsections
Priority: http://www.debian.org/doc/debian-policy/ch-archive.html#s-priorities
Architecture: http://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Architecture

http://www.debian.org/doc/debian-policy/ch-source.html#s-debianrules
```
vim rules
```

uncomment
```
export DH_VERBOSE=1
export DH_OPTIONS=-v
```

source/format info http://www.debian.org/doc/manuals/maint-guide/dother.en.html#sourcef
```
cat source/format
```

Other files: http://www.debian.org/doc/manuals/maint-guide/dother.en.html

Building
--------
```
cd ~/batman-0.1.0
```

`-us -uc` do not gpg sign package
```
diff_fs dpkg-buildpackage -us -uc
```

`dpkg-source` command man: http://www.opennet.ru/man.shtml?topic=dpkg-source  
`dpkg-source -b` Build a source package.  

`dh` man http://man.he.net/man1/dh  
`dh clean --no-act` check called debhelpers  

debhelpers
```
dh clean
    dh_testdir
    dh_auto_clean
    dh_clean

dh build
    dh_testdir
    dh_auto_configure
    dh_auto_build
    dh_auto_test
...
```

Install
-------
http://help.ubuntu.ru/wiki/%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE_%D0%BF%D0%BE_ubuntu_server/%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%B0%D0%BC%D0%B8/dpkg
```
diff_fs sudo dpkg -i batman_0.1.0_all.deb
```


Remove
------
```
diff_fs sudo dpkg -r batman
```
