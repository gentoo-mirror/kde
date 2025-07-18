# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=9999
QTMIN=6.9.1
inherit ecm plasma.kde.org xdg

DESCRIPTION="Integrate Chrome/Firefox better into Plasma through browser extensions"
HOMEPAGE+=" https://community.kde.org/Plasma/Browser_Integration"

LICENSE="GPL-3+"
SLOT="6"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,widgets]
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kfilemetadata-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kjobwidgets-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/kstatusnotifieritem-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	>=kde-plasma/plasma-activities-${KDE_CATV}:6
	>=kde-plasma/plasma-workspace-${KDE_CATV}:6
"
DEPEND="${RDEPEND}
	>=kde-frameworks/krunner-${KFMIN}:6
"

src_configure() {
	local mycmakeargs=(
		-DMOZILLA_DIR="${EPREFIX}/usr/$(get_libdir)/mozilla"
	)

	ecm_src_configure
}
