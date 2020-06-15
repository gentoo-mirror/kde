# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
KFMIN=9999
PVCUT=$(ver_cut 1-3)
QTMIN=5.14.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Plugin based library to create window decorations"

LICENSE="|| ( LGPL-2.1 LGPL-3 )"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
"
RDEPEND="${DEPEND}"
