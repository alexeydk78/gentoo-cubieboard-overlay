EAPI=5

inherit autotools git-r3

EGIT_REPO_URI="git://github.com/mosterta/libvdpau.git"

DESCRIPTION="This is an experimental VDPAU implementation for sunxi SoCs."
HOMEPAGE="https://github.com/mosterta/libvdpau-sunxi"

LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS=""
IUSE="static-libs"

DEPEND=""

DOCS=( README )

src_prepare() {
	eautoreconf
}

src_install() {
	default

	prune_libtool_files --modules

	use static-libs || find "${ED}" -name '*.a' -exec rm -f {} +
}
