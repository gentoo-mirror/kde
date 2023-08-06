# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_EXAMPLES="true"
ECM_TEST="true"
inherit ecm kde.org

DESCRIPTION="Non-blocking Qt database framework"
HOMEPAGE="https://api.kde.org/futuresql/html/index.html https://invent.kde.org/libraries/futuresql"

LICENSE="MIT"
SLOT="5"
KEYWORDS=""
IUSE=""

RESTRICT="!test? ( test )"

RDEPEND="dev-qt/qtsql:5"
DEPEND="${RDEPEND}
	examples? ( dev-libs/qcoro5 )
	test? ( dev-libs/qcoro5 )
"

src_install() {
	if use examples; then
		docinto examples
		dodoc -r examples/*
	fi
	ecm_src_install
}
