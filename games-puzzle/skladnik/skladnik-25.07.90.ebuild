# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
PVCUT=$(ver_cut 1-3)
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org xdg

DESCRIPTION="The Japanese warehouse keeper sokoban game"
HOMEPAGE="https://apps.kde.org/skladnik/ https://invent.kde.org/games/skladnik"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~loong ~riscv ~x86"

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui,widgets]
	>=kde-apps/libkdegames-${PVCUT}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kxmlgui-${KFMIN}:6
"
DEPEND="${RDEPEND}"
BDEPEND="media-gfx/povray"
