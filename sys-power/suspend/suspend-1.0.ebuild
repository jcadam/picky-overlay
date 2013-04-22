# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit autotools eutils

DESCRIPTION="Userspace Software Suspend and S2Ram"
HOMEPAGE="http://suspend.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P/-/-utils-}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fbsplash crypt threads"

X86_RDEPEND="dev-libs/libx86"
X86_DEPEND="
	${X86_RDEPEND}
	>=sys-apps/pciutils-2.2.4"
RDEPEND=">=dev-libs/lzo-2[static-libs]
	fbsplash? ( >=media-gfx/splashutils-1.5.2 )
	crypt? ( dev-libs/libgcrypt[static-libs]
		dev-libs/libgpg-error[static-libs] )
	x86? ( ${X86_RDEPEND} )
	amd64? ( ${X86_RDEPEND} )"
DEPEND="${RDEPEND}
	x86? ( ${X86_DEPEND} )
	amd64? ( ${X86_DEPEND} )
	virtual/pkgconfig"

S="${WORKDIR}/${P/-/-utils-}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-errno.patch
	epatch "${FILESDIR}"/${P}-bzip2.patch
	eautoreconf
}

src_configure() {
	econf \
		--docdir="/usr/share/doc/${PF}" \
		--enable-compress \
		$(use_enable crypt encrypt) \
		$(use_enable fbsplash) \
		$(use_enable threads)
}

src_install() {
	dodir etc
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "In order to make this package work with genkernel see:"
	elog "http://bugs.gentoo.org/show_bug.cgi?id=156445"
}
