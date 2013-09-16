Preparation
-----------

    cd ex01-simplest-package-ever
    mkdir batman-0.1.0 && cd batman-0.1.0  
    dh_make --native --single

`dh_make` man: [manpages.ubuntu.com](http://manpages.ubuntu.com/manpages/karmic/man8/dh_make.8.html)  
`--native` means native package, not quilt.  
`--single` package will generate a single binary .deb package  

    cd debian
    
    # Removing all examples and other uninteresting files
    rm -rf *.{ex,EX} README* docs

    cat changelog
    cat compat
    cat source/format


  * changelog format: [debian-policy](http://www.debian.org/doc/debian-policy/ch-source.html#s-dpkgchangelog)
  * debhelper compatibility level [debian-maint-guide](http://www.debian.org/doc/manuals/maint-guide/dother.en.html#compat)
  * source/format info [debian-maint-guide](http://www.debian.org/doc/manuals/maint-guide/dother.en.html#sourcef)


Edit some files. (stupid markdown, what do you want from me?)

    vim control
    vim rules
    # uncomment for verbosity
    export DH_VERBOSE=1
    export DH_OPTIONS=-v

  * control file info: [debian-policy](http://www.debian.org/doc/debian-policy/ch-controlfields.html)
      * section: [debian-policy](http://www.debian.org/doc/debian-policy/ch-archive.html#s-subsections)
      * priority: [debian-policy](http://www.debian.org/doc/debian-policy/ch-archive.html#s-priorities)
      * architecture: [debian-policy](http://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Architecture)
  * about rules [debian-policy](http://www.debian.org/doc/debian-policy/ch-source.html#s-debianrules)


About other files: [debian-maint-guide](http://www.debian.org/doc/manuals/maint-guide/dother.en.html)

Building
--------
    cd ~/batman-0.1.0
    diff_fs dpkg-buildpackage -us -uc
    # -us -uc do not gpg sign package


`dpkg-source` command: [opennet.ru](http://www.opennet.ru/man.shtml?topic=dpkg-source)  
`dpkg-source -b` Build a source package.  

`dh` [man.he.net](http://man.he.net/man1/dh)  
`dh clean --no-act` check called debhelpers  

Some debhelpers:

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


Install & remove
----------------
    diff_fs sudo dpkg -i batman_0.1.0_all.deb
    diff_fs sudo dpkg -r batman
    
dpkg man [ubuntu.ru](http://help.ubuntu.ru/wiki/%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE_%D0%BF%D0%BE_ubuntu_server/%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%B0%D0%BC%D0%B8/dpkg)
