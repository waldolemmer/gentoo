# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Sphinx Doxygen renderer"
HOMEPAGE="
	https://breathe.readthedocs.io/en/latest/
	https://github.com/breathe-doc/breathe/
	https://pypi.org/project/breathe/
"
SRC_URI="
	https://github.com/breathe-doc/breathe/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux"

RDEPEND="
	app-text/doxygen
	dev-python/docutils[${PYTHON_USEDEP}]
	>=dev-python/sphinx-4.0.0[${PYTHON_USEDEP}]
	dev-texlive/texlive-bibtexextra
	dev-texlive/texlive-fontsextra
	dev-texlive/texlive-fontutils
	dev-texlive/texlive-latex
	dev-texlive/texlive-latexextra
"
# defusedxml via sphinx.testing
BDEPEND="
	test? (
		dev-python/defusedxml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	# https://github.com/breathe-doc/breathe/pull/956
	"${FILESDIR}/${P}-sphinx-7.2.patch"
)
