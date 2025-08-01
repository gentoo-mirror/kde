# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="forceoptional"
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org xdg

DESCRIPTION="Mastodon client for Plasma and Plasma Mobile"
HOMEPAGE="https://apps.kde.org/tokodon/"

LICENSE="CC-BY-SA-4.0 GPL-2+ GPL-3+ || ( LGPL-2.1+ LGPL-3+ ) MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE="webengine"

# TODO: Add kunifiedpush support once packaged (cd01eb31d1ec298d4c1e10d25a0781d799161bfc)
COMMON_DEPEND="
	>=dev-libs/kirigami-addons-1.1.0:6
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	>=dev-qt/qtbase-${QTMIN}:6[gui,network,widgets]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6[qml]
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-qt/qtwebsockets-${QTMIN}:6
	>=kde-frameworks/breeze-icons-${KFMIN}:*
	>=kde-frameworks/kcolorscheme-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6[qml]
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdeclarative-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/prison-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	webengine? ( >=dev-qt/qtwebview-${QTMIN}:6 )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/qcoro[network]
	test? ( >=dev-qt/qthttpserver-${QTMIN}:6 )
"
RDEPEND="${COMMON_DEPEND}
	>=kde-frameworks/kitemmodels-${KFMIN}:6
	>=kde-frameworks/sonnet-${KFMIN}:6[qml]
"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package webengine Qt6WebView) # "only makes sense on mobile"
	)
	ecm_src_configure
}
