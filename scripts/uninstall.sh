#! /bin/bash

OPT_LOCATION=${HOME}/vectrum.cdt/opt

binaries=(
   vectrum-ranlib
   vectrum-ar
   vectrum-objdump
   vectrum-readelf
   vectrum-abigen
   vectrum-wasm2wast
   vectrum-wast2wasm
   vectrum-pp
   vectrum-cc
   vectrum-cpp
   vectrum-ld
   vectrum-abidiff
   vectrum-init
   llvm-readelf
   llvm-objdump
   llvm-ar
   llvm-ranlib
)

if [ -d "/usr/local/vectrum.cdt" ]; then
   printf "Do you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            if [ "$(id -u)" -ne 0 ]; then
               printf "\nThis requires sudo, please run ./uninstall.sh with sudo\n\n"
               exit -1
            fi
            pushd /usr/local &> /dev/null
            rm -rf vectrum.cdt
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            pushd lib/cmake &> /dev/null
            rm -rf vectrum.cdt
            popd &> /dev/null
            break;;
         [Nn]* ) 
            printf "Aborting uninstall\n\n"
            exit -1;;
      esac
   done
fi

if [ -d "/usr/local/vectrum.wasmsdk" ]; then
   printf "Do you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            if [ "$(id -u)" -ne 0 ]; then
               printf "\nThis requires sudo, please run ./uninstall.sh with sudo\n\n"
               exit -1
            fi
            pushd /usr/local &> /dev/null
            rm -rf vectrum.wasmsdk
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            break;;

         [Nn]* ) 
            printf "Aborting uninstall\n\n"
            exit -1;;
      esac
   done
fi

if [ -d ${HOME}/vectrum.cdt ] || [[ $1 == "force-new" ]]; then
   printf "Do you wish to remove this install?\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            pushd $HOME &> /dev/null
            pushd opt &> /dev/null
            rm -rf vectrum.cdt
            popd &> /dev/null
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            pushd lib/cmake &> /dev/null
            rm -rf vectrum.cdt
            popd &> /dev/null
            break;;
         [Nn]* )
            printf "\tAborting uninstall\n\n"
            exit -1;;
      esac
   done
fi