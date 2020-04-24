# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 )
inherit distutils-r1

DESCRIPTION="Parser for CMakeLists.txt files"
HOMEPAGE="https://pypi.python.org/pypi/parse_cmake/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/${P}-python3-fix.patch" )

src_prepare() {
	distutils-r1_src_prepare
	sed -i setup.py -e "s/'pyPEG2'//" || die
	mv tests tests-hidden || die
}
