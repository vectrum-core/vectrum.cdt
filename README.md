# VECTRUM.CDT (Contract Development Toolkit)
## Version : 0.1.0

VECTRUM.CDT is a toolchain for WebAssembly (WASM) and set of tools to facilitate smart contract development for the VECTRUM platform. In addition to being a general purpose WebAssembly toolchain, [VECTRUM](https://github.com/vectrum-core/vectrum) specific optimizations are available to support building VECTRUM smart contracts.  This new toolchain is built around `Clang 7`, which means that VECTRUM.CDT has the most currently available optimizations and analyses from LLVM, but as the WASM target is still considered experimental, some optimizations are incomplete or not available.

### New Introductions
As of this release two new repositories are under the suite of tools provided by **VECTRUM.CDT**.  These are the [Ricardian Template Toolkit](https://github.com/eosio/ricardian-template-toolkit) and the [Ricardian Specification](https://github.com/eosio/ricardian-spec).  The **Ricardian Template Toolkit** is a set of libraries to facilitate smart contract writers in crafting their Ricardian contracts.  The Ricardian specification is the working specification for the above mentioned toolkit.  Please note that both projects are **alpha** releases and are subject to change.

## Binary Releases
VECTRUM.CDT currently supports Mac OS X brew, Linux x86_64 Debian packages, and Linux x86_64 RPM packages.

**If you have previously installed VECTRUM.CDT, run the `uninstall` script (it is in the directory where you cloned VECTRUM.CDT) before downloading and using the binary releases.**

### Mac OS X Brew Install
```sh
brew tap vectrum-core/vectrum.cdt
brew install vectrum.cdt
```

### Mac OS X Brew Uninstall
```sh
brew remove vectrum.cdt
```

### Debian Package Install
```sh
$ wget https://github.com/vectrum-core/vectrum.cdt/releases/download/v0.1.0/vectrum.cdt_0.1.0-1-ubuntu-18.04_amd64.deb
$ sudo apt install ./vectrum.cdt_0.1.0-1-ubuntu-18.04_amd64.deb
```

### Debian Package Uninstall
```sh
sudo apt remove vectrum.cdt
```

### RPM Package Install
```sh
$ wget https://github.com/vectrum-core/vectrum.cdt/releases/download/v0.1.0/vectrum.cdt-0.1.0-1.el7.x86_64.rpm
$ sudo yum install ./vectrum.cdt-0.1.0-1.el7.x86_64.rpm
```

### RPM Package Uninstall
```sh
sudo yum remove vectrum.cdt
```

## Guided Installation or Building from Scratch
```sh
git clone --recursive https://github.com/vectrum-core/vectrum.cdt
cd vectrum.cdt
mkdir build
cd build
cmake ..
make -j8
```

From here onward you can build your contracts code by simply exporting the `build` directory to your path, so you don't have to install globally (makes things cleaner).
Or you can install globally by running this command:

```sh
sudo make install
```

### Uninstall after manual installation

```sh
sudo rm -fr /usr/local/vectrum.cdt
sudo rm -fr /usr/local/lib/cmake/vectrum.cdt
sudo rm /usr/local/bin/vectrum-*
```

## Installed Tools

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

## License
See [LICENSE](./LICENSE) for copyright and license terms.
See [EOSIO LICENSE](./eosio.license) for copyright and license terms.
