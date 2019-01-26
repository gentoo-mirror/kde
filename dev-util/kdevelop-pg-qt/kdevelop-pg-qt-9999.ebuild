# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDEBASE="kdevelop"
KDE_TEST="forceoptional"
inherit kde5

DESCRIPTION="LL(1) parser generator used mainly by KDevelop language plugins"
LICENSE="LGPL-2+ LGPL-2.1+"
IUSE=""
[[ ${KDE_BUILD_TYPE} = release ]] && KEYWORDS="~amd64 ~x86"

BDEPEND="
	sys-devel/bison
	sys-devel/flex
"
RDEPEND="
	!dev-util/kdevelop-pg-qt:4
"
