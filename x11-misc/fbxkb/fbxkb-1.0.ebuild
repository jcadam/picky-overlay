# Copyright 2014 Adam Jiang <jiang.adam@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools eutils git-2

DESCRIPTION="X11 keyboard indicator and switcher"
HOMEPAGE="https://github.com/basinilya/fbxkb"

EGIT_REPO_URI="https://github.com/basinilya/fbxkb.git"

LICENSE="GPL-2"
SLOT="1"

KEYWORDS="amd64 ppc x86"

RDEPEND="x11-libs/libX11
		>=x11-libs/gtk+-2.6
		x11-libs/pixman
		dev-libs/atk
		media-libs/libpng"

DEPEND="${RDEPEND}
		dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/0001-Add-cflags-and-libs-for-X11.patch
}
