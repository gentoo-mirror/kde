# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME="dolphin-plugins"
MY_PLUGIN_NAME="svn"
PVCUT=$(ver_cut 1-3)
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org

DESCRIPTION="Dolphin plugin for Subversion integration"
HOMEPAGE="https://apps.kde.org/dolphin_plugins/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
IUSE=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=kde-apps/dolphin-${PVCUT}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/ktextwidgets-${KFMIN}:6
"
RDEPEND="${DEPEND}
	dev-vcs/subversion
	>=kde-apps/dolphin-plugins-common-${PV}
	>=kde-apps/kompare-${PVCUT}:*
"

src_prepare() {
	ecm_src_prepare
	ecm_punt_po_install
	# qtconcurrent only required by git
	ecm_punt_qt_module Concurrent
	# solid, qtdbus only required by mountiso
	ecm_punt_qt_module DBus
	ecm_punt_kf_module Solid
	# kxmlgui, qtnetwork only required by dropbox
	ecm_punt_qt_module Network
	ecm_punt_kf_module XmlGui
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_${MY_PLUGIN_NAME}=ON
		-DBUILD_bazaar=OFF
		-DBUILD_dropbox=OFF
		-DBUILD_git=OFF
		-DBUILD_hg=OFF
		-DBUILD_makefileactions=OFF
		-DBUILD_mountiso=OFF
	)
	ecm_src_configure
}
