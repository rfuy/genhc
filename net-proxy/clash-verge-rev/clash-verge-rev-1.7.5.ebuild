# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop unpacker xdg
DESCRIPTION="Continuation of Clash Verge - A Clash Meta GUI based on Tauri (Windows, MacOS, Linux)"
HOMEPAGE="https://clash-verge-rev.github.io/"
MY_PN=clash-verge
SRC_URI="amd64? ( https://gh.api.99988866.xyz/https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v${PV}/${MY_PN}_${PV}_amd64.deb )"
#x86? ( https://ghproxy.org/https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v${PV}/clash-verge_${PV}_i386.deb )
#arm64? ( https://ghproxy.org/https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v${PV}/clash-verge_${PV}_arm64.deb )
#arm? ( https://ghproxy.org/https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v${PV}/clash-verge_${PV}_armhf.deb )
RESTRICT="primary-url strip"

LICENSE="GPL-3"
SLOT="0"
#KEYWORDS="amd64 ~x86 ~arm64 ~armv7"
KEYWORDS="amd64"
S=${WORKDIR}
DEPEND="
dev-libs/libayatana-appindicator
net-libs/webkit-gtk:4
dev-libs/openssl
x11-libs/gtk+
"
RDEPEND="${DEPEND}"
BDEPEND=""
src_unpack() {
	unpack_deb ${MY_PN}_${PV}_${ARCH}.deb
}
src_install() {
	insinto /
	doins -r *
	fperms +x /usr/bin/{clash-verge,verge-mihomo,verge-mihomo-alpha}
}
