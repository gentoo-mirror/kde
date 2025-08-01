# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org

DESCRIPTION="Thumbnail generator for PO files"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	sys-devel/gettext
"
RDEPEND="${DEPEND}
	!<kde-apps/kdesdk-thumbnailers-24.05.2-r1:5
	!kde-apps/kdesdk-thumbnailers-common
"
