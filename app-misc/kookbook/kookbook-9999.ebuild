# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_CATEGORY=utilities
KFMIN=5.82.0
QTMIN=5.15.4
inherit ecm kde.org

DESCRIPTION="Simple recipe manager taking structured markdown for recipes"
HOMEPAGE="https://invent.kde.org/utilities/kookbook"

LICENSE="BSD"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtprintsupport-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
RDEPEND="${DEPEND}
	>=dev-qt/qtsvg-${QTMIN}:5
"
