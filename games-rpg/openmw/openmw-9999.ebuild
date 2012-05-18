# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils cmake-utils git

EGIT_REPO_URI="git://github.com/zinnschlag/openmw.git"

DESCRIPTION="OpenMW is a new engine for The Elder Scrolls 3: Morrowind"
HOMEPAGE="http://openmw.org/en/"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_configure() {
	cmake-utils_src_configure
}
