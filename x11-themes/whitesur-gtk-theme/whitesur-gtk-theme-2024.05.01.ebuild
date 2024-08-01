# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="MacOS Big Sur like theme for Gnome desktops"
HOMEPAGE="https://github.com/vinceliuice/WhiteSur-gtk-theme"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	SRC_URI="https://github.com/vinceliuice/WhiteSur-gtk-theme/archive/refs/tags/$(ver_cut 1)-$(ver_cut 2)-$(ver_cut 3).tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"
	S="${WORKDIR}/WhiteSur-gtk-theme-$(ver_cut 1)-$(ver_cut 2)-$(ver_cut 3)"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="dev-lang/sassc
	dev-libs/glib
	dev-libs/libxml2
"
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${ED}/usr/share/themes"
	./install.sh \
	--monterey \
	--icon standard \
	--dest "${ED}/usr/share/themes"
}
