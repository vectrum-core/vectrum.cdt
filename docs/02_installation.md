---
content_title: Binary Releases
---

VECTRUM.CDT currently supports Mac OS X brew, Linux x86_64 Debian packages, and Linux x86_64 RPM packages.

**If you have previously installed VECTRUM.CDT, run the `uninstall` script (it is in the directory where you cloned VECTRUM.CDT) before downloading and using the binary releases.**

## Mac OS X Brew Install
```sh
$ brew tap vectrum-core/vectrum.cdt
$ brew install vectrum.cdt
```

## Mac OS X Brew Uninstall
```sh
$ brew remove vectrum.cdt
```

## Debian Package Install
```sh
$ wget https://github.com/vectrum-core/vectrum.cdt/releases/download/v0.1.0/vectrum.cdt_0.1.0-1-ubuntu-18.04_amd64.deb
$ sudo apt install ./vectrum.cdt_0.1.0-1-ubuntu-18.04_amd64.deb
```

## Debian Package Uninstall
```sh
$ sudo apt remove vectrum.cdt
```

## RPM Package Install
```sh
$ wget https://github.com/vectrum-core/vectrum.cdt/releases/download/v0.1.0/vectrum.cdt-0.1.0-1.el7.x86_64.rpm
$ sudo yum install ./vectrum.cdt-0.1.0-1.el7.x86_64.rpm
```

## RPM Package Uninstall
```sh
$ sudo yum remove vectrum.cdt
```

# Guided Installation or Building from Scratch
```sh
$ git clone --recursive https://github.com/vectrum-core/vectrum.cdt
$ cd vectrum.cdt
$ mkdir build
$ cd build
$ cmake ..
$ make -j8
```

From here onward you can build your contracts code by simply exporting the `build` directory to your path, so you don't have to install globally (makes things cleaner).
Or you can install globally by running this command

```sh
sudo make install
```

## Uninstall after manual installation

```sh
$ sudo rm -fr /usr/local/vectrum.cdt
$ sudo rm -fr /usr/local/lib/cmake/vectrum.cdt
$ sudo rm /usr/local/bin/vectrum-*
```


# Installed Tools

* vectrum-cpp
* vectrum-cc
* vectrum-ld
* vectrum-init
* vectrum-abidiff
* vectrum-wasm2wast
* vectrum-wast2wasm
* vectrum-ranlib
* vectrum-ar
* vectrum-objdump
* vectrum-readelf

Below tools are not installed after brew install, you get them only by building the repository and installing from scracth, [see here](#guided_installation_or_building_from_scratch)
vectrum-abidiff
vectrum-ranlib
vectrum-ar
vectrum-objdump
vectrum-readelf


License

[MIT](../LICENSE)
