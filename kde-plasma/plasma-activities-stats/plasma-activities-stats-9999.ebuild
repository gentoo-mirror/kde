# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=9999
QTMIN=6.9.1
inherit ecm plasma.kde.org

DESCRIPTION="Library for accessing usage data collected by the activities system"

LICENSE="LGPL-2+"
SLOT="6"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,sql]
	>=kde-frameworks/kconfig-${KFMIN}:6
	kde-plasma/plasma-activities:6
"
DEPEND="${RDEPEND}
	test? ( dev-libs/boost )
"
