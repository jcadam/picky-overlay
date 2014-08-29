# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit git-2

DESCRIPTION="A hack to disable gtk+ 3 client side decoration"
HOMEPAGE="https://github.com/PCMan/gtk3-nocsd"

EGIT_REPO_URI="https://github.com/PCMan/gtk3-nocsd.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=x11-libs/gtk+-3.10
	virtual/pkgconfig"
RDEPEND="${DEPEND}"

src_compile() {
	if [ -x ./build.sh ]; then
		./build.sh || die "Compilation failed!"
	fi
}

src_install() {
	dolib gtk3-nocsd.so || die "Installation failed!"
}
