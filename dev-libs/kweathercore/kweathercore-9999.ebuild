# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_NONGUI="true"
ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org

DESCRIPTION="Library for retrieval of weather information including forecasts and alerts"
HOMEPAGE="https://invent.kde.org/libraries/kweathercore"

LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[network]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtpositioning-${QTMIN}:6
	>=kde-frameworks/kholidays-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
"
RDEPEND="${DEPEND}"

CMAKE_SKIP_TESTS=(
	locationquerytest
	# bug 906392
	metnoparsertest
)
