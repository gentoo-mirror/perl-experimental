# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=DMUEY
inherit perl-module

DESCRIPTION="Merges arbitrarily deep hashes into a single hash "

IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-perl/Clone
"
DEPEND="
	${RDEPEND}
"
