# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-games/ogre/ogre-1.7.4.ebuild,v 1.2 2012/05/03 06:35:31 jdhore Exp $

EAPI="4"

inherit eutils cmake-utils

MY_PV=${PV//./-}
DESCRIPTION="Object-oriented Graphics Rendering Engine"
HOMEPAGE="http://www.ogre3d.org/"
SRC_URI="http://sourceforge.net/projects/ogre/files/ogre/${PV%.0}/${PV}-RC1/${PN}_src_v${MY_PV}RC1.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+boost cg doc double-precision examples +freeimage ois +opengl poco profile tbb test threads tools +zip"
REQUIRED_USE="threads? ( || ( boost poco tbb ) )"
RESTRICT="test" #139905

RDEPEND="media-libs/freetype:2
	virtual/opengl
	virtual/glu
	x11-libs/libX11
	x11-libs/libXaw
	x11-libs/libXrandr
	x11-libs/libXt
	boost? ( dev-libs/boost )
	cg? ( media-gfx/nvidia-cg-toolkit )
	freeimage? ( media-libs/freeimage )
	ois? ( dev-games/ois )
	threads? (
		poco? ( dev-libs/poco )
		tbb? ( dev-cpp/tbb )
	)
	zip? ( sys-libs/zlib dev-libs/zziplib )"
DEPEND="${RDEPEND}
	x11-proto/xf86vidmodeproto
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
	test? ( dev-util/cppunit )"

S=${WORKDIR}/${PN}_src_v${MY_PV}RC1


src_prepare() {
#	epatch "${FILESDIR}"/${P}-gcc46.patch
#	epatch "${FILESDIR}"/${P}-threading.patch
	sed -i \
		-e "s:share/OGRE/docs:share/doc/${PF}:" \
		Docs/CMakeLists.txt || die
	# Stupid build system hardcodes release names
	sed -i \
		-e '/CONFIGURATIONS/s:CONFIGURATIONS.*::' \
		CMake/Utils/OgreConfigTargets.cmake || die
}

src_configure() {
	local mycmakeargs=(
		-DOGRE_FULL_RPATH=NO
		$(cmake-utils_use boost OGRE_USE_BOOST)
		$(cmake-utils_use cg OGRE_BUILD_PLUGIN_CG)
		$(cmake-utils_use doc OGRE_INSTALL_DOCS)
		$(cmake-utils_use double-precision OGRE_CONFIG_DOUBLE)
		$(cmake-utils_use examples OGRE_INSTALL_SAMPLES)
		$(cmake-utils_use freeimage OGRE_CONFIG_ENABLE_FREEIMAGE)
		$(cmake-utils_use opengl OGRE_BUILD_RENDERSYSTEM_GL)
		$(cmake-utils_use profile OGRE_PROFILING)
		$(cmake-utils_use test OGRE_BUILD_TESTS)
		$(cmake-utils_use threads OGRE_CONFIG_THREADS)
		$(cmake-utils_use tools OGRE_BUILD_TOOLS)
		$(cmake-utils_use zip OGRE_CONFIG_ENABLE_ZIP)
	)

	if use threads ; then
		local f
		for f in poco tbb boost ; do
			use ${f} || continue
			mycmakeargs+=( -DOGRE_CONFIG_THREAD_PROVIDER=${f} )
			break
		done
	fi

	cmake-utils_src_configure
}
