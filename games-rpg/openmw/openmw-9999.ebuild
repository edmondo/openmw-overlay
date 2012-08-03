# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils cmake-utils git-2

EGIT_REPO_URI="git://github.com/zinnschlag/openmw.git"
EGIT_HAS_SUBMODULES="yes"

DESCRIPTION="OpenMW is a new engine for The Elder Scrolls 3: Morrowind"
HOMEPAGE="http://openmw.org/en/"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	dobin ${CMAKE_BUILD_DIR}/openmw
	dobin ${CMAKE_BUILD_DIR}/omwlauncher

	dodir /usr/share/games/openmw
	insinto /usr/share/games/openmw
	doins -r ${CMAKE_BUILD_DIR}/resources

	dodir /etc/openmw
	insinto /etc/openmw
	doins ${CMAKE_BUILD_DIR}/settings-default.cfg
	doins ${CMAKE_BUILD_DIR}/transparency-overrides.cfg
	doins ${CMAKE_BUILD_DIR}/openmw.cfg
	doins ${CMAKE_BUILD_DIR}/launcher.cfg
}
