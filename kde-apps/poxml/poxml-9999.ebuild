# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
KFMIN=6.12.0
QTMIN=6.7.2
inherit ecm gear.kde.org

DESCRIPTION="KDE utility to translate DocBook XML files using gettext po files"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[xml]
	sys-devel/gettext
"
RDEPEND="${DEPEND}"
