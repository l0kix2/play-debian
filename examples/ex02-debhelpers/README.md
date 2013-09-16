```
cd ~/batman-0.1.0
```

Clean stage
-----------
Let's assume that we creating file while building and want delete it in clean  
```touch debian/stupid-file```

Edit rules  
```vim debian/rules```

```
override_dh_clean:
[tab]        dh_clean
[tab]        rm debian/stupid-file
```

```diff_fs dpkg-buildpackage -us -uc```

(edit rules backwards)

Build stage
-----------
http://manpages.ubuntu.com/manpages/intrepid/man1/dh_auto_build.1.html 
dh_auto_build will run make build or python setup.py build or something else.

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

Info
----
Lists of debhelper sequences for each stage.
```
dh clean --no-act
dh build --no-act
dh binary --no-act
```

Debhelper dh overrides http://joeyh.name/blog/entry/debhelper_dh_overrides/
List of almost all debhelpers http://manpages.ubuntu.com/manpages/intrepid/man7/debhelper.7.html
Make manual: http://www.gnu.org/software/make/manual/make.html
