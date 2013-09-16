Info
----
Lists of debhelper sequences for each stage.
```
dh clean --no-act
dh build --no-act
dh binary --no-act
```

debhelper dh overrides http://joeyh.name/blog/entry/debhelper_dh_overrides/  
debhelpers http://manpages.ubuntu.com/manpages/intrepid/man7/debhelper.7.html

```
cd ~/batman-0.1.0
```

Clean
-----
let's assume that we creating file while building and want delete it in clean
```touch debian/stupid-file```

```vim debian/rules```

http://www.gnu.org/software/make/manual/make.html
```
override_dh_clean:
[tab]        dh_clean
[tab]        rm debian/stupid-file
```

```diff_fs dpkg-buildpackage -us -uc```

(edit rules backwards)

Build
-----
http://manpages.ubuntu.com/manpages/intrepid/man1/dh_auto_build.1.html will run make build or python setup.py build or something

Binary
------
http://manpages.ubuntu.com/manpages/intrepid/man1/dh_installdirs.1.html
```
vim debian/batman.dirs

some_dir
dir/inside/dir
```

simple run
```
dh_installdirs
```

**build**
```
dpkg-buildpackage -us -uc
```

**install**
```
diff_fs sudo dpkg -i ../batman_0.1.0_all.deb
+/dir
+/dir/inside
+/dir/inside/dir
+/some_dir
...
```

**remove**
```
diff_fs sudo dpkg -r batman
```

see also
http://manpages.ubuntu.com/manpages/intrepid/man1/dh_link.1.html
