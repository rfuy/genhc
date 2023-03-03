# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A rule-based tunnel in Go"
HOMEPAGE="https://github.com/Dreamacro/clash"
SRC_URI="amd64? ( https://github.com/Dreamacro/clash/releases/download/v${PV}/clash-linux-amd64-v${PV}.gz -> ${P}_amd64.gz )
x86? ( https://github.com/Dreamacro/clash/releases/download/v${PV}/clash-linux-386-v${PV}.gz -> ${P}_x86.gz )
arm64? ( https://github.com/Dreamacro/clash/releases/download/v${PV}/clash-linux-arm64-v${PV}.gz -> ${P}_arm64.gz )
mips? ( https://github.com/Dreamacro/clash/releases/download/v${PV}/clash-linux-mips64-v${PV}.gz -> ${P}_mips.gz )
riscv? ( https://github.com/Dreamacro/clash/releases/download/v${PV}/clash-linux-riscv64-v${PV}.gz -> ${P}_riscv.gz )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S=${WORKDIR}
RESTRICT="strip"
src_prepare() {
	default
}

src_install() {
	newbin ${P}_${ARCH} ${PN}

}
