# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils cmake-utils git-2

EGIT_REPO_URI="git://github.com/zinnschlag/openmw.git"

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

	dodir /usr/share/games/openmw/resources
	insinto /usr/share/games/openmw/resources
	doins ${CMAKE_BUILD_DIR}/resources/*

	dodir /usr/share/games/openmw/resources/mygui
	insinto /usr/share/games/openmw/resources/mygui
	doins ${CMAKE_BUILD_DIR}/resources/mygui/*

	dodir /usr/share/games/openmw/resources/shadows
	insinto /usr/share/games/openmw/resources/shadows
	doins ${CMAKE_BUILD_DIR}/resources/shadows/*

	dodir /usr/share/games/openmw/resources/water
	insinto /usr/share/games/openmw/resources/water
	doins ${CMAKE_BUILD_DIR}/resources/water/*

	dodir /usr/share/games/openmw/resources/gbuffer
	insinto /usr/share/games/openmw/resources/gbuffer
	doins ${CMAKE_BUILD_DIR}/resources/gbuffer/*

	dodir /etc/openmw
	insinto /etc/openmw
	doins ${CMAKE_BUILD_DIR}/settings-default.cfg
	doins ${CMAKE_BUILD_DIR}/transparency-overrides.cfg
	doins ${CMAKE_BUILD_DIR}/openmw.cfg
	doins ${CMAKE_BUILD_DIR}/plugins.cfg
}
