# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=9999
QTMIN=6.9.1
inherit ecm plasma.kde.org

DESCRIPTION="Qt component to allow applications make use of Wayland wl-layer-shell protocol"

LICENSE="LGPL-3+"
SLOT="6"
KEYWORDS=""
IUSE=""

# slot op: various private QtWaylandClient headers
RDEPEND="
	>=dev-libs/wayland-1.15
	>=dev-qt/qtbase-${QTMIN}:6=[gui,wayland]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	x11-libs/libxkbcommon
"
DEPEND="${RDEPEND}
	dev-libs/wayland-protocols
"
RDEPEND+=" || ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 )"
BDEPEND="
	dev-util/wayland-scanner
	virtual/pkgconfig
"
