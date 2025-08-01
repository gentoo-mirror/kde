# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="true"
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org

DESCRIPTION="KDE calculator"
HOMEPAGE="https://apps.kde.org/kcalc/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/gmp:=
	dev-libs/mpc:=
	dev-libs/mpfr:=
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets,xml]
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kxmlgui-${KFMIN}:6
"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gettext"

src_test() {
	LC_NUMERIC="C" ecm_src_test
}
