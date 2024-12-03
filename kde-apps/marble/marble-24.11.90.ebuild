# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional" # see src/apps/marble-kde/CMakeLists.txt
ECM_TEST="forceoptional"
KFMIN=6.5.0
QTMIN=6.7.2
inherit ecm gear.kde.org

DESCRIPTION="Virtual Globe and World Atlas to learn more about Earth"
HOMEPAGE="https://marble.kde.org/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
IUSE="aprs +dbus designer +geolocation gps +kde +pbf phonon shapefile +webengine"

# bug 588320
RESTRICT="test"

# FIXME (new package): libwlocate, WLAN-based geolocation
DEPEND="
	>=dev-qt/qt5compat-${QTMIN}:6
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,dbus?,gui,network,sql,widgets,xml]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	sys-libs/zlib
	aprs? ( >=dev-qt/qtserialport-${QTMIN}:6 )
	designer? ( >=dev-qt/qttools-${QTMIN}:6[designer] )
	geolocation? ( >=dev-qt/qtpositioning-${QTMIN}:6 )
	gps? ( sci-geosciences/gpsd:= )
	kde? (
		>=kde-frameworks/kconfig-${KFMIN}:6
		>=kde-frameworks/kconfigwidgets-${KFMIN}:6
		>=kde-frameworks/kcoreaddons-${KFMIN}:6
		>=kde-frameworks/kcrash-${KFMIN}:6
		>=kde-frameworks/ki18n-${KFMIN}:6
		>=kde-frameworks/kio-${KFMIN}:6
		>=kde-frameworks/knewstuff-${KFMIN}:6
		>=kde-frameworks/kparts-${KFMIN}:6
		>=kde-frameworks/krunner-${KFMIN}:6
		>=kde-frameworks/kservice-${KFMIN}:6
		>=kde-frameworks/kwallet-${KFMIN}:6
	)
	pbf? ( dev-libs/protobuf:= )
	phonon? ( >=media-libs/phonon-4.12.0[qt6(+)] )
	shapefile? ( sci-libs/shapelib:= )
	webengine? (
		>=dev-qt/qtwebchannel-${QTMIN}:6
		>=dev-qt/qtwebengine-${QTMIN}:6[widgets]
	)
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-qt/qttools-${QTMIN}:6[linguist]
	aprs? ( dev-lang/perl )
"

src_prepare() {
	ecm_src_prepare

	rm -rf src/3rdparty/zlib || die "Failed to remove bundled libs"
}

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package aprs Perl)
		$(cmake_use_find_package geolocation Qt6Positioning)
		-DBUILD_MARBLE_TESTS=$(usex test)
		-DBUILD_WITH_DBUS=$(usex dbus)
		-DWITH_DESIGNER_PLUGIN=$(usex designer)
		-DWITH_libgps=$(usex gps)
		-DWITH_KF6=$(usex kde)
		$(cmake_use_find_package pbf Protobuf)
		-DWITH_Phonon4Qt6=$(usex phonon)
		-DWITH_libshp=$(usex shapefile)
		$(cmake_use_find_package webengine Qt6WebEngineWidgets)
		-DWITH_libwlocate=OFF
		# bug 608890
		-DKDE_INSTALL_CONFDIR="/etc/xdg"
	)
	if use kde; then
		ecm_src_configure
	else
		cmake_src_configure
	fi
}