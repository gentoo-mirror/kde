# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KF5MIN=5.116.0
KFMIN=9999
QT5MIN=5.15.17
QTMIN=6.9.1
inherit ecm plasma.kde.org xdg

DESCRIPTION="Breeze visual style for the Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/breeze"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE="qt5"

# kde-frameworks/kwindowsystem[X]: Unconditional use of KX11Extras
RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/frameworkintegration-${KFMIN}:6
	>=kde-frameworks/kcmutils-${KFMIN}:6
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6[X]
	>=kde-plasma/kdecoration-${KDE_CATV}:6
	qt5? (
		>=dev-qt/qtdbus-${QT5MIN}:5
		>=dev-qt/qtdeclarative-${QT5MIN}:5
		>=dev-qt/qtgui-${QT5MIN}:5
		>=dev-qt/qtwidgets-${QT5MIN}:5
		>=dev-qt/qtx11extras-${QT5MIN}:5
		>=kde-frameworks/frameworkintegration-${KF5MIN}:5
		>=kde-frameworks/kcmutils-${KF5MIN}:5
		>=kde-frameworks/kconfig-${KF5MIN}:5
		>=kde-frameworks/kconfigwidgets-${KF5MIN}:5
		>=kde-frameworks/kcoreaddons-${KF5MIN}:5
		>=kde-frameworks/kguiaddons-${KF5MIN}:5
		>=kde-frameworks/ki18n-${KF5MIN}:5
		>=kde-frameworks/kiconthemes-${KF5MIN}:5
		>=kde-frameworks/kirigami-${KF5MIN}:5
		>=kde-frameworks/kwidgetsaddons-${KF5MIN}:5
		>=kde-frameworks/kwindowsystem-${KF5MIN}:5
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=kde-frameworks/kcmutils-${KFMIN}:6
	qt5? ( >=kde-frameworks/kcmutils-${KF5MIN}:5 )
"
PDEPEND=">=kde-frameworks/breeze-icons-${KFMIN}:*"

src_configure() {
	local mycmakeargs=(
		-DBUILD_QT6=ON
		-DBUILD_QT5=$(usex qt5)
	)
	ecm_src_configure
}
