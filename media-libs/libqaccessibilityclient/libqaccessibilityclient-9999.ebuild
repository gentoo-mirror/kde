# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_KDEINSTALLDIRS="false"
ECM_TEST="true"
ECM_EXAMPLES="true"
QTMIN=5.15.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Library for writing accessibility clients such as screen readers"
HOMEPAGE="https://community.kde.org/Accessibility https://invent.kde.org/libraries/libqaccessibilityclient"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
fi

LICENSE="LGPL-2.1"
SLOT="5"
IUSE=""

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
RDEPEND="${DEPEND}"

# tests require DBus
RESTRICT+=" test"
