# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Time-HiRes/perl-Time-HiRes-1.972.500-r1.ebuild,v 1.12 2013/03/02 16:38:22 ago Exp $

DESCRIPTION="Virtual for ${PN#perl-}"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| ( =dev-lang/perl-5.18* =dev-lang/perl-5.16* ~perl-core/${PN#perl-}-${PV} )"