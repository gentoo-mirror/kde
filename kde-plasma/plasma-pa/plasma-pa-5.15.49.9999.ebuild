# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_REMOVE_MODULES_LIST=( FindGLIB2 )
KDE_HANDBOOK="forceoptional"
inherit kde5

DESCRIPTION="Plasma applet for audio volume management using PulseAudio"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep plasma)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-libs/glib:2
	media-libs/libcanberra
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kirigami)
	$(add_qt_dep qtquickcontrols)
	media-libs/libcanberra
	x11-themes/sound-theme-freedesktop
"

PATCHES=( "${FILESDIR}/${PN}-5.15.4-gsettings.patch" )
