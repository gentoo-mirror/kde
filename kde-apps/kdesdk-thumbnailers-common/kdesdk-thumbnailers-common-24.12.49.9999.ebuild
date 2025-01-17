# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME="${PN/-common/}"
KFMIN=6.7.0
inherit ecm-common gear.kde.org

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="
	!<kde-apps/kdesdk-thumbnailers-24.05.2-r1:5
	!<kde-apps/kdesdk-thumbnailers-24.05.2-r10:6
"

ECM_INSTALL_FILES=(
	po_thumbnailer/pocreatorsettings.kcfg:\${KDE_INSTALL_KCFGDIR}
)
