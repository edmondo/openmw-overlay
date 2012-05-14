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
#	local mycmakeargs=(
#		-DOGRE_FULL_RPATH=NO
#		$(cmake-utils_use boost OGRE_USE_BOOST)
#		$(cmake-utils_use cg OGRE_BUILD_PLUGIN_CG)
#		$(cmake-utils_use doc OGRE_INSTALL_DOCS)
#		$(cmake-utils_use double-precision OGRE_CONFIG_DOUBLE)
#		$(cmake-utils_use examples OGRE_INSTALL_SAMPLES)
#		$(cmake-utils_use freeimage OGRE_CONFIG_ENABLE_FREEIMAGE)
#		$(cmake-utils_use opengl OGRE_BUILD_RENDERSYSTEM_GL)
#		$(cmake-utils_use profile OGRE_PROFILING)
#		$(cmake-utils_use test OGRE_BUILD_TESTS)
#		$(cmake-utils_use threads OGRE_CONFIG_THREADS)
#		$(cmake-utils_use tools OGRE_BUILD_TOOLS)
#		$(cmake-utils_use zip OGRE_CONFIG_ENABLE_ZIP)
#	)
#
#	if use threads ; then
#		local f
#		for f in poco tbb boost ; do
#			use ${f} || continue
#			mycmakeargs+=( -DOGRE_CONFIG_THREAD_PROVIDER=${f} )
#			break
#		done
#	fi

	cmake-utils_src_configure
}
