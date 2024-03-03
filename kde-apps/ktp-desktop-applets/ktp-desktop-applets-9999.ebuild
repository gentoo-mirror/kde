# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.115.0
QTMIN=5.15.12
inherit ecm gear.kde.org

DESCRIPTION="KDE Telepathy contact, presence and chat Plasma applets"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="|| ( GPL-2 GPL-3 ) GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-plasma/libplasma-${KFMIN}:5
"
DEPEND="${RDEPEND}
	>=kde-frameworks/ki18n-${KFMIN}:5
"
