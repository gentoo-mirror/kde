# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.9.0
QTMIN=6.7.2
inherit ecm gear.kde.org

DESCRIPTION="Wrapper around exiv2 library"

LICENSE="GPL-2+"
SLOT="6"
KEYWORDS=""
IUSE="+xmp"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[gui]
	>=media-gfx/exiv2-0.25:=[xmp=]
"
RDEPEND="${DEPEND}"
