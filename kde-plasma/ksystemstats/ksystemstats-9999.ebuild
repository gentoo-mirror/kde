# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
ECM_TEST="forceoptional"
KFMIN=9999
QTMIN=6.9.1
inherit ecm fcaps plasma.kde.org

DESCRIPTION="Plugin-based system monitoring daemon"

LICENSE="GPL-2+"
SLOT="6"
KEYWORDS=""
IUSE="networkmanager"

DEPEND="
	dev-libs/libnl:3
	>=dev-qt/qtbase-${QTMIN}:6[dbus,network]
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/solid-${KFMIN}:6
	>=kde-plasma/libksysguard-${KDE_CATV}:6
	net-libs/libpcap
	sys-apps/lm-sensors:=
	sys-libs/libcap
	virtual/libudev:=
	networkmanager? ( >=kde-frameworks/networkmanager-qt-${KFMIN}:6 )
"
RDEPEND="${DEPEND}"

# -m 0755 to avoid suid with USE="-filecaps"
FILECAPS=( -m 0755 cap_perfmon=ep usr/libexec/ksystemstats_intel_helper )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_Libcap=ON
		$(cmake_use_find_package networkmanager KF6NetworkManagerQt)
	)
	ecm_src_configure
}

CMAKE_SKIP_TESTS=(
	# bug 909312, needs virtualx but we don't care
	ksystemstatstest
)
