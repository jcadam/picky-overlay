# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-evdev/xf86-input-evdev-2.8.0.ebuild,v 1.1 2013/03/27 10:46:57 chithanh Exp $

EAPI=5
inherit xorg-2

DESCRIPTION="Generic Linux input driver"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86"
IUSE="coderemap"

RDEPEND=">=x11-base/xorg-server-1.12[udev]
	sys-libs/mtdev"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-2.1.99.3
	>=sys-kernel/linux-headers-2.6"

src_prepare() {
	default
	use coderemap && epatch "${FILESDIR}/${P}-code-remap.patch"
}
