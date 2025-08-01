# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="true"
KFMIN=9999
QTMIN=6.9.1
inherit ecm plasma.kde.org

DESCRIPTION="Dedicated search application built on top of Baloo"
HOMEPAGE="https://invent.kde.org/plasma/milou"

LICENSE="GPL-2 LGPL-2.1"
SLOT="6"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/krunner-${KFMIN}:6
	>=kde-frameworks/ksvg-${KFMIN}:6
	>=kde-plasma/libplasma-${KDE_CATV}:6
"
RDEPEND="${DEPEND}"
