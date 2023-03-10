# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker xdg desktop
DESCRIPTION="A good-looking third-party NetEase cloud music player ,supporting Windows / macOS / Linux"
HOMEPAGE="https://github.com/qier222/YesPlayMusic"
SRC_URI="amd64? ( https://github.com/qier222/YesPlayMusic/releases/download/v${PV}/yesplaymusic_${PV}_amd64.deb )
arm64? ( https://github.com/qier222/YesPlayMusic/releases/download/v${PV}/yesplaymusic_${PV}_arm64.deb ) "
MY_PN="YesPlayMusic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S=${WORKDIR}
RESTRICT="strip"
src_install () {
	for size in {16,24,32,48,64,128,256,512,1024}; do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/${PN}.png
	done
	domenu  usr/share/applications/yesplaymusic.desktop
	gunzip usr/share/doc/${PN}/changelog.gz || die
	dodoc usr/share/doc/${PN}/changelog
	insinto /
	doins -r opt
	fperms +x /opt/${MY_PN}/${PN}
}
