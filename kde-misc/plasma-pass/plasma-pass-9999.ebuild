# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=6.9.0
QTMIN=6.8.1
inherit ecm kde.org

DESCRIPTION="Plasma applet to access password from pass"
HOMEPAGE="https://www.dvratil.cz/2018/05/plasma-pass/ https://invent.kde.org/plasma/plasma-pass"

if [[ ${KDE_BUILD_TYPE} != live ]] ; then
	SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"
	KEYWORDS="~amd64 ~ppc64 ~riscv"
fi

LICENSE="LGPL-2.1+"
SLOT="6"
IUSE=""

DEPEND="
	dev-cpp/gpgmepp:=
	dev-libs/qgpgme:=
	>=dev-qt/qt5compat-${QTMIN}:6[qml]
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,dbus,gui]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kitemmodels-${KFMIN}:6
	kde-plasma/libplasma:6
	kde-plasma/plasma5support:6
	sys-auth/oath-toolkit
"
RDEPEND="${DEPEND}
	!${CATEGORY}/${PN}:5
	>=kde-frameworks/kirigami-${KFMIN}:6
"
