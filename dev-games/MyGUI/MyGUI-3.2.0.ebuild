# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils cmake-utils

DESCRIPTION="fast, simple and flexible GUI"
HOMEPAGE="http://www.ogre3d.org/tikiwiki/MyGUI"
SRC_URI="http://sourceforge.net/projects/my-gui/files/${PN}/${PN}_${PV}/${PN}_${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-games/ogre
        dev-games/ois"

S=${WORKDIR}/${PN}_${PV}

src_configure() {

	local mycmakeargs=(
		-DMYGUI_INSTALL_TOOLS=TRUE
		-DMYGUI_BUILD_SAMPLES=FALSE
		-DMYGUI_BUILD_TESTS=FALSE
		-DMYGUI_INSTALL_MEDIA=FALSE
	)

	CMAKE_BUILD_TYPE=""
	cmake-utils_src_configure
}
