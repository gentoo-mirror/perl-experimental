# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2
MODULE_AUTHOR=KENTNL
inherit perl-module

DESCRIPTION="Sugar Syntax for moose 'has' fields"
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
COMMON_DEPEND="
	dev-perl/Sub-Exporter
"
DEPEND="
	${COMMON_DEPEND}
	test? ( dev-perl/Moose )
"
RDEPEND="
	${COMMON_DEPEND}
"
SRC_TEST="do"
