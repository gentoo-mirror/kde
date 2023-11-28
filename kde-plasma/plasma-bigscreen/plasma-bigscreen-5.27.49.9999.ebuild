# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.106.0
PVCUT=$(ver_cut 1-3)
QTMIN=5.15.9
inherit ecm plasma.kde.org

DESCRIPTION="Plasma shell for TVs"
HOMEPAGE="https://plasma-bigscreen.org/"

LICENSE="Apache-2.0 GPL-2"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-plasma/kwayland-${PVCUT}:5
	>=kde-plasma/libkworkspace-5.19.0:5
	>=kde-plasma/libplasma-${PVCUT}:5
	>=kde-plasma/plasma-activities-${PVCUT}:5
	>=kde-plasma/plasma-activities-stats-${PVCUT}:5
"
RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtvirtualkeyboard-${QTMIN}:5
"
