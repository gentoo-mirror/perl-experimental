# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=BOBTFISH
inherit perl-module

DESCRIPTION="Catalyst plugin: maintain session IDs using cookies"
LICENSE="|| ( Artistic GPL-2 )"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
DEPEND="
	>=dev-perl/Catalyst-Runtime-5.7010
	>=dev-perl/Catalyst-Plugin-Session-0.19
	>=dev-perl/Test-MockObject-1.01
"
RDEPEND="${DEPEND}"
