# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org xdg

DESCRIPTION="Simple video player"
HOMEPAGE="https://apps.kde.org/dragonplayer/"

LICENSE="GPL-2+ || ( GPL-2 GPL-3 ) handbook? ( FDL-1.2 )"
SLOT="6"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kirigami-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gettext"
