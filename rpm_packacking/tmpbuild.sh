#!/bin/sh

  RPM_SOURCE_DIR="/home/bernd/rpmbuild/SOURCES"
  RPM_BUILD_DIR="/home/bernd/rpmbuild/BUILD"
  RPM_OPT_FLAGS="-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m64 -mtune=generic"
  RPM_LD_FLAGS="-Wl,-z,relro -specs=/usr/lib/rpm/redhat/redhat-hardened-ld"
  RPM_ARCH="x86_64"
  RPM_OS="linux"
  export RPM_SOURCE_DIR RPM_BUILD_DIR RPM_OPT_FLAGS RPM_LD_FLAGS RPM_ARCH RPM_OS
  RPM_DOC_DIR="/usr/share/doc"
  export RPM_DOC_DIR
  RPM_PACKAGE_NAME="libntru"
  RPM_PACKAGE_VERSION="0.5"
  RPM_PACKAGE_RELEASE=".fc25"
  export RPM_PACKAGE_NAME RPM_PACKAGE_VERSION RPM_PACKAGE_RELEASE
  LANG=C
  export LANG
  unset CDPATH DISPLAY ||:
  RPM_BUILD_ROOT="/home/bernd/rpmbuild/BUILDROOT/libntru-0.5-.fc25.x86_64"
  export RPM_BUILD_ROOT
  
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/lib64/pkgconfig:/usr/share/pkgconfig"
  export PKG_CONFIG_PATH
  CONFIG_SITE=${CONFIG_SITE:-NONE}
  export CONFIG_SITE
  
  set -x
  umask 022
  cd "/home/bernd/rpmbuild/BUILD"
cd 'libntru-0.5'

echo "Build"

make


