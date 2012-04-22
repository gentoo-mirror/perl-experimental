# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/perl/perl-5.14.2.ebuild,v 1.4 2012/03/03 12:29:38 grobian Exp $

EAPI=4

inherit eutils alternatives flag-o-matic toolchain-funcs multilib

PATCH_VER=5

PERL_OLDVERSEN="5.14.0 5.14.1"
MODULE_AUTHOR=FLORA

SHORT_PV="${PV%.*}"
MY_P="perl-${PV/_rc/-RC}"
MY_PV="${PV%_rc*}"

DESCRIPTION="Larry Wall's Practical Extraction and Report Language"

SRC_URI="
	mirror://cpan/src/${MY_P}.tar.bz2
	mirror://cpan/authors/id/${MODULE_AUTHOR:0:1}/${MODULE_AUTHOR:0:2}/${MODULE_AUTHOR}/${MY_P}.tar.bz2
	mirror://gentoo/${MY_P}-${PATCH_VER}.tar.bz2
	http://dev.gentoo.org/~tove/distfiles/${CATEGORY}/${PN}/${MY_P}-${PATCH_VER}.tar.bz2"
HOMEPAGE="http://www.perl.org/"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="berkdb debug doc gdbm ithreads"

RDEPEND="
	berkdb? ( sys-libs/db )
	gdbm? ( >=sys-libs/gdbm-1.8.3 )
	app-arch/bzip2
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	!prefix? ( elibc_FreeBSD? ( sys-freebsd/freebsd-mk-defs ) )
"
PDEPEND=">=app-admin/perl-cleaner-2.5"

S="${WORKDIR}/${MY_P}"

dual_scripts() {
	src_remove_dual      perl-core/Archive-Tar        1.760.0      ptar ptardiff ptargrep
	src_remove_dual      perl-core/Digest-SHA         5.610.0      shasum
	src_remove_dual      perl-core/CPAN               1.960.1_rc   cpan
	src_remove_dual      perl-core/CPANPLUS           0.910.300    cpanp cpan2dist
	src_remove_dual_file perl-core/CPANPLUS           0.910.300    /usr/bin/cpanp-run-perl
	src_remove_dual      perl-core/Encode             2.420.100_rc enc2xs piconv
	src_remove_dual      perl-core/ExtUtils-MakeMaker 6.570.500_rc instmodsh
	src_remove_dual      perl-core/ExtUtils-ParseXS   2.221.0      xsubpp
	src_remove_dual      perl-core/JSON-PP            2.271.50     json_pp
	src_remove_dual      perl-core/Module-Build       0.380.0      config_data
	src_remove_dual      perl-core/Module-CoreList    2.490.200_rc corelist
	src_remove_dual      perl-core/PodParser          1.370.0      pod2usage podchecker podselect
	src_remove_dual      perl-core/Test-Harness       3.230.0      prove
	src_remove_dual      perl-core/podlators          2.4.0        pod2man pod2text
	src_remove_dual_man  perl-core/podlators          2.4.0        /usr/share/man/man1/perlpodstyle.1
}

# eblit-include [--skip] <function> [version]
eblit-include() {
	local skipable=false
	[[ $1 == "--skip" ]] && skipable=true && shift
	[[ $1 == pkg_* ]] && skipable=true

	local e v func=$1 ver=$2
	[[ -z ${func} ]] && die "Usage: eblit-include <function> [version]"
	for v in ${ver:+-}${ver} -${PVR} -${PV} "" ; do
		e="${FILESDIR}/eblits/${func}${v}.eblit"
		if [[ -e ${e} ]] ; then
			source "${e}"
			return 0
		fi
	done
	${skipable} && return 0
	die "Could not locate requested eblit '${func}' in ${FILESDIR}/eblits/"
}

# eblit-run-maybe <function>
# run the specified function if it is defined
eblit-run-maybe() {
	[[ $(type -t "$@") == "function" ]] && "$@"
}

# eblit-run <function> [version]
# aka: src_unpack() { eblit-run src_unpack ; }
eblit-run() {
	eblit-include --skip common "${*:2}"
	eblit-include "$@"
	eblit-run-maybe eblit-$1-pre
	eblit-${PN}-$1
	eblit-run-maybe eblit-$1-post
}

#src_unpack()	{ eblit-run src_unpack    v50140021 ; }
src_prepare()	{ eblit-run src_prepare   v50140021 ; }
src_configure()	{ eblit-run src_configure v50140021 ; }
#src_compile()	{ eblit-run src_compile   v50140021 ; }
src_test()		{ eblit-run src_test      v50140021 ; }
src_install()	{ eblit-run src_install   v50140021 ; }

# FILESDIR might not be available during binpkg install
# FIXME: version passing
for x in setup {pre,post}{inst,rm} ; do
	e="${FILESDIR}/eblits/pkg_${x}-v50140021.eblit"
	if [[ -e ${e} ]] ; then
		. "${e}"
		eval "pkg_${x}() { eblit-run pkg_${x} v50140021 ; }"
	fi
done
