# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=3
MODULE_AUTHOR=ASH
MODULE_VERSION="1.003000"
inherit perl-module

DESCRIPTION="first class try catch semantics for Perl, without source filters"
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
COMMON_DEPEND="
	>=dev-perl/Parse-Method-Signatures-1.3.12
	>=dev-perl/B-Hooks-EndOfScope-0.80.0
	>=dev-perl/B-Hooks-OP-Check-0.180.0
	>=dev-perl/B-Hooks-OP-PPAddr-0.30.0
	>=dev-perl/Devel-Declare-0.5.7
	dev-perl/Moose
	dev-perl/MooseX-Types
	>=dev-perl/Scope-Upper-0.60.0
	>=dev-perl/Variable-Magic-0.280.0
	>=dev-perl/Sub-Exporter-0.979
	virtual/perl-XSLoader
"
DEPEND="
	>=dev-perl/extutils-depends-0.302
	${COMMON_DEPEND}
	test? (
		>=virtual/perl-Test-Simple-0.88
		dev-perl/Test-Exception
	)
"
RDEPEND="
	${COMMON_DEPEND}
"
SRC_TEST="do"
