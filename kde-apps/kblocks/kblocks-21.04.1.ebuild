# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_HANDBOOK="forceoptional"
ECM_TEST="forceoptional"
PVCUT=$(ver_cut 1-3)
KFMIN=5.80.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="Single-player Tetris-like KDE game"
HOMEPAGE="https://apps.kde.org/en/kblocks"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-apps/libkdegames-${PVCUT}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
"
RDEPEND="${DEPEND}"
