# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="MacOS Big Sur style icon theme for linux desktops"
HOMEPAGE="https://github.com/vinceliuice/WhiteSur-icon-theme"

MY_PV=$(ver_cut 1)-$(ver_cut 2)-$(ver_cut 3)
if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="https://github.com/vinceliuice/WhiteSur-icon-theme/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
	S="${WORKDIR}/WhiteSur-icon-theme-${MY_PV}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
"
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${ED}/usr/share/icons"
	./install.sh \
	--dest "${ED}/usr/share/icons"
}
