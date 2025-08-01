# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_DESIGNERPLUGIN="true"
ECM_HANDBOOK="optional"
ECM_QTHELP="true"
ECM_TEST="true"
KFMIN=6.16.0
QTMIN=6.9.1
inherit ecm gear.kde.org optfeature xdg

DESCRIPTION="Non-linear video editing suite by KDE"
HOMEPAGE="https://kdenlive.org/en/"

LICENSE="GPL-3"
SLOT="6"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="gles2-only semantic-desktop v4l"

RESTRICT="test" # segfaults, bug 684132

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,dbus,gles2-only=,gui,network,widgets,xml]
	>=dev-qt/qtdeclarative-${QTMIN}:6[widgets]
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtnetworkauth-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=kde-frameworks/karchive-${KFMIN}:6
	>=kde-frameworks/kbookmarks-${KFMIN}:6
	>=kde-frameworks/kcodecs-${KFMIN}:6
	>=kde-frameworks/kcompletion-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kconfigwidgets-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kfilemetadata-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kiconthemes-${KFMIN}:6
	>=kde-frameworks/kio-${KFMIN}:6
	>=kde-frameworks/kitemviews-${KFMIN}:6
	>=kde-frameworks/kjobwidgets-${KFMIN}:6
	>=kde-frameworks/knewstuff-${KFMIN}:6
	>=kde-frameworks/knotifications-${KFMIN}:6
	>=kde-frameworks/knotifyconfig-${KFMIN}:6
	>=kde-frameworks/kservice-${KFMIN}:6
	>=kde-frameworks/ktextwidgets-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=kde-frameworks/kxmlgui-${KFMIN}:6
	>=kde-frameworks/purpose-${KFMIN}:6
	>=kde-frameworks/solid-${KFMIN}:6
	>=media-libs/mlt-7.28.0[ffmpeg,frei0r,qt6,sdl,xml]
	media-libs/opentimelineio:=
	v4l? ( media-libs/libv4l )
"
RDEPEND="${DEPEND}
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:6
	media-video/ffmpeg[encode(+),libass,sdl,X]
	media-video/mediainfo
"
BDEPEND="sys-devel/gettext"
DEPEND+=" virtual/os-headers"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package v4l LibV4L2)
		# disable fetching of opentimelineio
		-DFETCH_OTIO=OFF
	)
	ecm_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "VP8 and VP9 codec support" "media-video/ffmpeg[vpx]"
}
