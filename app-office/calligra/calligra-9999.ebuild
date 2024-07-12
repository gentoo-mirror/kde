# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHECKREQS_DISK_BUILD="4G"
ECM_HANDBOOK="forceoptional"
ECM_TEST="forceoptional"
KFMIN=6.3.0
QTMIN=6.6.2
inherit check-reqs ecm kde.org

DESCRIPTION="KDE Office Suite"
HOMEPAGE="https://calligra.org/"

if [[ ${KDE_BUILD_TYPE} == release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~ppc64 ~x86"
fi

PATCHSET="${PN}-3.2.1-patchset-1"
SRC_URI+=" https://dev.gentoo.org/~asturm/distfiles/${PATCHSET}.tar.xz"

CAL_FTS=( karbon sheets stage words )

LICENSE="GPL-2"
SLOT="0"
IUSE="+charts +crypt +fontconfig gemini gsl +import-filter +lcms
	okular +pdf phonon spacenav +truetype X
	$(printf 'calligra_features_%s ' ${CAL_FTS[@]})"

RESTRICT="test"

# TODO: Not packaged: Cauchy (https://bitbucket.org/cyrille/cauchy)
# Required for the matlab/octave formula tool
COMMON_DEPEND="
	dev-lang/perl
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,network,widgets,xml]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-qt/qttools-${QTMIN}:6[designer]
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kcmutils-${KFMIN}:6
	>=kde-frameworks/kcompletion-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kitemviews-${KFMIN}:6
	>=kde-frameworks/kjobwidgets-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/knotifyconfig-${KFMIN}:6
	>=kde-frameworks/kparts-${KFMIN}:6
	>=kde-frameworks/ktextwidgets-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kwindowsystem-${KFMIN}:6
	>=kde-frameworks/kxmlgui-${KFMIN}:6
	>=kde-frameworks/sonnet-${KFMIN}:6
	sys-libs/zlib
	virtual/libiconv
	charts? ( dev-libs/kdiagram:6 )
	crypt? ( dev-libs/openssl:= )
	fontconfig? ( media-libs/fontconfig )
	gemini? ( >=dev-qt/qtdeclarative-${QTMIN}:6[widgets] )
	gsl? ( sci-libs/gsl:= )
	import-filter? (
		app-text/libetonyek
		app-text/libodfgen
		app-text/libwpd:*
		app-text/libwpg:*
		>=app-text/libwps-0.4
		dev-libs/librevenge
		media-libs/libvisio
	)
	lcms? ( media-libs/lcms:2 )
	okular? ( kde-apps/okular:6 )
	pdf? ( app-text/poppler:=[qt6] )
	phonon? ( >=media-libs/phonon-4.12.0[qt6(+)] )
	spacenav? ( dev-libs/libspnav )
	truetype? ( media-libs/freetype:2 )
	calligra_features_sheets? ( dev-cpp/eigen:3 )
	calligra_features_words? ( dev-libs/libxslt )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
	lcms? ( dev-libs/imath:3 )
	test? ( >=kde-frameworks/threadweaver-${KFMIN}:6 )
"
RDEPEND="${COMMON_DEPEND}
	!${CATEGORY}/${PN}:5
	calligra_features_karbon? ( media-gfx/pstoedit[plotutils] )
	gemini? ( >=kde-frameworks/kirigami-${KFMIN}:6 )
"
BDEPEND="sys-devel/gettext"

PATCHES=( "${WORKDIR}"/${PATCHSET}/${PN}-3.1.89-no-arch-detection.patch ) # downstream

pkg_pretend() {
	check-reqs_pkg_pretend
}

pkg_setup() {
	ecm_pkg_setup
	check-reqs_pkg_setup
}

src_prepare() {
	ecm_src_prepare

	# Unconditionally disable deprecated deps (required by QtQuick1)
	ecm_punt_qt_module Declarative
	ecm_punt_qt_module OpenGL
}

src_configure() {
	local cal_ft myproducts

	# applications
	for cal_ft in ${CAL_FTS[@]}; do
		use calligra_features_${cal_ft} && myproducts+=( "${cal_ft^^}" )
	done

	use lcms && myproducts+=( PLUGIN_COLORENGINES )
	use okular && myproducts+=( OKULAR )
	use spacenav && myproducts+=( PLUGIN_SPACENAVIGATOR )

	local mycmakeargs=(
		-DPACKAGERS_BUILD=OFF
		-DRELEASE_BUILD=ON
		-DWITH_Iconv=ON
		-DWITH_Imath=ON # w/ LCMS: 16 bit floating point Grayscale colorspace
		-DCMAKE_DISABLE_FIND_PACKAGE_Cauchy=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_KF6CalendarCore=ON
		-DPRODUCTSET="${myproducts[*]}"
		$(cmake_use_find_package charts KChartQt6)
		$(cmake_use_find_package crypt OpenSSL)
		-DWITH_Fontconfig=$(usex fontconfig)
		$(cmake_use_find_package gemini LibGit2)
		-DWITH_GSL=$(usex gsl)
		-DWITH_LibEtonyek=$(usex import-filter)
		-DWITH_LibOdfGen=$(usex import-filter)
		-DWITH_LibRevenge=$(usex import-filter)
		-DWITH_LibVisio=$(usex import-filter)
		-DWITH_LibWpd=$(usex import-filter)
		-DWITH_LibWpg=$(usex import-filter)
		-DWITH_LibWps=$(usex import-filter)
		$(cmake_use_find_package phonon Phonon4Qt6)
		-DWITH_LCMS2=$(usex lcms)
		-DWITH_Okular6=$(usex okular)
		-DWITH_Poppler=$(usex pdf)
		-DWITH_Eigen3=$(usex calligra_features_sheets)
		-DBUILD_UNMAINTAINED=$(usex calligra_features_stage)
		-DWITH_Freetype=$(usex truetype)
	)

	ecm_src_configure
}
