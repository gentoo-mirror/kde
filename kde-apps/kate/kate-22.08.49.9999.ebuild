# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
KFMIN=5.96.0
QTMIN=5.15.5
VIRTUALX_REQUIRED="test"
inherit ecm flag-o-matic gear.kde.org

DESCRIPTION="Multi-document editor with network transparency, Plasma integration and more"
HOMEPAGE="https://kate-editor.org/ https://apps.kde.org/kate/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	~kde-apps/kate-lib-${PV}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
"
RDEPEND="${DEPEND}
	~kde-apps/kate-addons-${PV}:5
"

src_prepare() {
	ecm_src_prepare

	# these tests are run in dev-libs/libkate
	cmake_run_in apps/lib cmake_comment_add_subdirectory autotests

	# delete colliding kwrite translations
	if [[ ${KDE_BUILD_TYPE} = release ]]; then
		rm -f po/*/*.po || die # installed by dev-libs/libkate
		rm -rf po/*/docs/kwrite || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_addons=FALSE
		-DBUILD_kwrite=FALSE
	)

	# provided by dev-libs/libkate
	append-libs -l/usr/$(get_libdir)/libkateprivate.so.${PV}

	ecm_src_configure
}

src_install() {
	ecm_src_install

	# provided by dev-libs/libkate
	rm -v "${D}"/usr/$(get_libdir)/libkateprivate.so.${PV} || die
}
