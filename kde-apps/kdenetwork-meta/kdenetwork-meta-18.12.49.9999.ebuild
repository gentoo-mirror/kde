# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="kdenetwork - merge this to pull in all kdenetwork-derived packages"
HOMEPAGE="https://www.kde.org/"

LICENSE="metapackage"
SLOT="5"
KEYWORDS=""
IUSE="+telepathy"

RDEPEND="
	>=kde-apps/kdenetwork-filesharing-${PV}:${SLOT}
	>=kde-apps/kget-${PV}:${SLOT}
	>=kde-apps/krdc-${PV}:${SLOT}
	>=kde-apps/kopete-${PV}:${SLOT}
	>=kde-apps/krfb-${PV}:${SLOT}
	>=kde-apps/zeroconf-ioslave-${PV}:${SLOT}
	telepathy? ( >=kde-apps/plasma-telepathy-meta-${PV}:${SLOT} )
"
