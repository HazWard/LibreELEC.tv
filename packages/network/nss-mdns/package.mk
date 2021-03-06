################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="nss-mdns"
PKG_VERSION="0.10"
PKG_SHA256="1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://0pointer.de/lennart/projects/nss-mdns/"
# PKG_URL="http://0pointer.de/lennart/projects/nss-mdns/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_URL="http://sources.openelec.tv/mirror/nss-mdns/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain avahi"
PKG_SECTION="network"
PKG_SHORTDESC="nss-mdns is a plugin for nss to allow name resolution via Multicast DNS."
PKG_LONGDESC="nss-mdns is a plugin for the GNU Name Service Switch (NSS) functionality of the GNU C Library (glibc) providing host name resolution via Multicast DNS (aka Zeroconf, aka Apple Rendezvous, aka Apple Bonjour), effectively allowing name resolution by common Unix/Linux programs in the ad-hoc mDNS domain .local."
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-lynx \
        --enable-avahi \
        --disable-legacy \
        --disable-search-domains"

post_makeinstall_target() {
  mkdir -p $INSTALL/etc
  cp $PKG_DIR/config/nsswitch.conf $INSTALL/etc/nsswitch.conf
}
