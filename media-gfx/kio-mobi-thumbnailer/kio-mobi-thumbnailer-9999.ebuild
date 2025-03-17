# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME="kdegraphics-thumbnailers"
PVCUT=$(ver_cut 1-3)
KFMIN=6.12.0
QTMIN=6.7.2
inherit ecm gear.kde.org

DESCRIPTION="KIO thumbnail generator for Mobipocket files"
HOMEPAGE="https://apps.kde.org/kdegraphics_thumbnailers/"

LICENSE="GPL-2+"
SLOT="6"
KEYWORDS=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui]
	>=kde-apps/kdegraphics-mobipocket-${PVCUT}:6
	>=kde-frameworks/kio-${KFMIN}:6
"
RDEPEND="${DEPEND}
	!<kde-apps/thumbnailers-24.05.2-r1:6
"

src_configure() {
	local mycmakeargs=(
		-DDISABLE_BLENDER=ON
		-DBUILD_ps=OFF
		-DCMAKE_DISABLE_FIND_PACKAGE_KExiv2Qt6=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_KDcrawQt6=ON
	)
	ecm_src_configure
}
