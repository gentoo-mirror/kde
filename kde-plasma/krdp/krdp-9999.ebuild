# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_EXAMPLES="true"
ECM_TEST="true"
KFMIN=9999
QTMIN=6.9.1
inherit ecm flag-o-matic plasma.kde.org toolchain-funcs xdg

DESCRIPTION="Library and examples for creating an RDP server"
HOMEPAGE+=" https://quantumproductions.info/articles/2023-08/remote-desktop-using-rdp-protocol-plasma-wayland"

LICENSE="GPL-2" # TODO: CHECK
SLOT="6"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	>=dev-libs/qtkeychain-0.14.2:=[qt6(+)]
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,network,wayland]
	>=dev-qt/qtdeclarative-${QTMIN}:6
	>=kde-frameworks/kcmutils-${KFMIN}:6
	>=kde-frameworks/kconfig-${KFMIN}:6
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/kcrash-${KFMIN}:6
	>=kde-frameworks/kdbusaddons-${KFMIN}:6
	>=kde-frameworks/kguiaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kstatusnotifieritem-${KFMIN}:6
	>=kde-plasma/kpipewire-${KDE_CATV}:6
	>=net-misc/freerdp-3.1:3[server]
	x11-libs/libxkbcommon
"
DEPEND="${COMMON_DEPEND}
	dev-libs/plasma-wayland-protocols
"
RDEPEND="${COMMON_DEPEND}
	>=kde-frameworks/kirigami-${KFMIN}:6
"
RDEPEND+=" || ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 )"
BDEPEND=">=kde-frameworks/kcmutils-${KFMIN}:6"

src_configure() {
	# std::jthread and std::stop_token are implemented as experimental in libcxx
	# enable these experimental libraries on clang systems
	# https://libcxx.llvm.org/Status/Cxx20.html#note-p0660
	[[ $(tc-get-cxx-stdlib) == 'libc++' ]] && append-cxxflags -fexperimental-library
	ecm_src_configure
}
