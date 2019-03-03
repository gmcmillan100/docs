---
layout: page
title: Latex
permalink: /latex
resource: true
categories: [gold]
description: A 400 oz bar
---

* [Installation](#installation)
* [Make a PDF](#make-a-pdf)
* [TOC Control in a PDF](#toc-control-in-a-pdf)
* [Markdown and RST Support](#markdown-and-rst-support)
* [Configuration Control](#configuration-control)
* [Bugs](#bugs)
* [Full pdflatex Log](#full-pdflatex-log)


Use Lamport TeX (LaTex) to export Sphinx RST/Markdown files to PDF. [Leslie Lamport](https://en.wikipedia.org/wiki/Leslie_Lamport) created LaTex.

About pronunciation. According to the TeX creator, Donald Knut, the creator of LaTex (Leslie Lamport) never decided how to pronounce it. Many say "Laahh Tech"; others say "Laayy tech". See https://www.youtube.com/watch?v=8HuwiBPLV3A

# Installation

For Mac, the [MacTeX distribution](http://www.tug.org/mactex/) contains everything you need, including a complete TeX system with LaTeX itself and editors to write documents.

The MacTex package is 2.5GB download. Install this one (not BasicTex) because the lite version hits many errors on the Sphinx latex.

https://www.latex-project.org/get/

Sphinx latex options, http://www.sphinx-doc.org/en/master/usage/configuration.html#latex-options

Check the installation location of `pdflatex`:
```
$ which pdflatex
/Library/TeX/texbin/pdflatex
```

Check the version of `pdflatex`:
```
$ pdflatex --version
pdfTeX 3.14159265-2.6-1.40.19 (TeX Live 2018)
kpathsea version 6.3.0
Copyright 2018 Han The Thanh (pdfTeX) et al.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Han The Thanh (pdfTeX) et al.
Compiled with libpng 1.6.34; using libpng 1.6.34
Compiled with zlib 1.2.11; using zlib 1.2.11
Compiled with xpdf version 4.00
```

# Make a PDF

1. Output a Sphinx doc to Latex format:

	```
	cd docs
	sphinx-build -b latex . _build/latex
	```
2. Inside the `latex` directory, the file `Tester.tex` is the default root file for the pdf.

3. Use `pdflatex` to convert the .tex file to pdf:

	```
	$ pdflatex Tester.tex
	```
4. Open `Tester.pdf`

# TOC Control in a PDF

The `toctree` in the `index.rst` controls the structure of the PDF.

```
.. toctree::
    :maxdepth: 3
    :caption: Table of Contents
    :name: mastertoc

    pages/file1
    pages/file2
```

# Markdown and RST Support

A mix of RST and Markdown formats is supported. The PDF can display both.

However in RST formatted files, an empty dummy heading must exist at the top of the file. It never gets printed in the PDF. If it's not there, the subsequent headings are out of order. A bug. 

RST files render fine like this:

```
Dummy RST Heading for Latex's PDF Tree
======================================

RST H1 (the chapter title)
======

RST H2
******

RST H3
^^^^^^

RST H4
@@@@@@
```

Markdown files render fine like this:

```
# Markdown H1 (the chapter title)

## Markdown H2

### Markdown H3
```

# Configuration Control

See Sphinx's `conf.py` to control different aspects over how the PDF is created.

PDF generation engine:

```
latex_engine = 'pdflatex'
```

An exported Latex filename (cerebras.tex) and front matter text:

```
latex_documents = [
    (master_doc, 'cerebras.tex', u'Cerebras Documentation',
     u'Confidential beta draft', 'manual'),
]
```

Logo on cover page:

```
latex_logo = 'images/logo.png'
```

More customizations at http://www.sphinx-doc.org/en/1.6/latex.html

# Bugs

Sometimes the TOC in the generated PDF does not update until run a second time. If there are errors in the log, run it again. The second time sticks.


# Full pdflatex Log

```
$ pdflatex Tester.tex 
This is pdfTeX, Version 3.14159265-2.6-1.40.19 (TeX Live 2018) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./Tester.tex
LaTeX2e <2018-04-01> patch level 2
Babel <3.18> and hyphenation patterns for 84 language(s) loaded.
(./sphinxmanual.cls
Document Class: sphinxmanual 2017/03/26 v1.6 Document class (Sphinx manual)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/report.cls
Document Class: report 2014/09/29 v1.4h Standard LaTeX document class
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/size10.clo)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/cmap/cmap.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/fontenc.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/t1enc.def)<<t1.cmap>>)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/switch.def)
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel-english/english.ldf
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/babel.def
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/txtbabel.def))))
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/times.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/fncychap/fncychap.sty)
(./sphinx.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ltxcmds.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/textcomp.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1enc.def
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1enc.dfu)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/titlesec/titlesec.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/tabulary/tabulary.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/tools/array.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/varwidth/varwidth.sty)
(./sphinxmulticell.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/makeidx.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/framed/framed.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-cfg/color.cfg))
(/usr/local/texlive/2018/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
Style option: `fancyvrb' v2.7a, with DG/SPQR fixes, and firstline=lastline fix 
<2008/02/07> (tvz)) (./footnotehyper-sphinx.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/float/float.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/wrapfig/wrapfig.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/parskip/parskip.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/alltt.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/upquote/upquote.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/capt-of/capt-of.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/needspace/needspace.sty)
(./sphinxhighlight.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/etexcmds.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifluatex.sty)))))
(/usr/local/texlive/2018/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifvtex.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/ifxetex/ifxetex.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2018/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2018/texmf-dist/tex/latex/url/url.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/hypcap.sty)
Writing index file Tester.idx
(./Tester.aux) (/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1cmr.fd)
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1ptm.fd)
(/usr/local/texlive/2018/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(./Tester.out) (./Tester.out)
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1phv.fd)<<ot1.cmap>><<oml
.cmap>><<oms.cmap>><<omx.cmap>>
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/umsb.fd) [1{/usr/local/t
exlive/2018/texmf-var/fonts/map/pdftex/updmap/pdftex.map}] [2] (./Tester.toc)
[1] [2] [1] [2]
Chapter 1.
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1pcr.fd) [3] [4]
Chapter 2.
[5] [6]
Chapter 3.
[7] [8]
Chapter 4.
[9] [10]
Chapter 5.
[11] [12]
Chapter 6.
No file Tester.ind.
[13] (./Tester.aux) ){/usr/local/texlive/2018/texmf-dist/fonts/enc/dvips/base/8
r.enc}</usr/local/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmmi5.
pfb></usr/local/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmsy5.pf
b></usr/local/texlive/2018/texmf-dist/fonts/type1/urw/courier/ucrb8a.pfb></usr/
local/texlive/2018/texmf-dist/fonts/type1/urw/courier/ucrr8a.pfb></usr/local/te
xlive/2018/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/local/texlive/2
018/texmf-dist/fonts/type1/urw/helvetic/uhvbo8a.pfb></usr/local/texlive/2018/te
xmf-dist/fonts/type1/urw/times/utmb8a.pfb></usr/local/texlive/2018/texmf-dist/f
onts/type1/urw/times/utmr8a.pfb>
Output written on Tester.pdf (17 pages, 100561 bytes).
Transcript written on Tester.log.
[gmcmilla@gmcmilla-mn2 ~/greg@linkedin/ubercode/docs/_build/latex]$ pdflatex Tester.tex 
This is pdfTeX, Version 3.14159265-2.6-1.40.19 (TeX Live 2018) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(./Tester.tex
LaTeX2e <2018-04-01> patch level 2
Babel <3.18> and hyphenation patterns for 84 language(s) loaded.
(./sphinxmanual.cls
Document Class: sphinxmanual 2017/03/26 v1.6 Document class (Sphinx manual)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/report.cls
Document Class: report 2014/09/29 v1.4h Standard LaTeX document class
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/size10.clo)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/inputenc.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/cmap/cmap.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/fontenc.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/t1enc.def)<<t1.cmap>>)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsmath.sty
For additional information on amsmath, use the `?' option.
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amstext.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsgen.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsbsy.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsmath/amsopn.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/amssymb.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/amsfonts.sty))
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/babel.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/switch.def)
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel-english/english.ldf
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/babel.def
(/usr/local/texlive/2018/texmf-dist/tex/generic/babel/txtbabel.def))))
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/times.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/fncychap/fncychap.sty)
(./sphinx.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ltxcmds.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/graphicx.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/keyval.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/graphics.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics/trig.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-cfg/graphics.cfg)
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-def/pdftex.def)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/textcomp.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1enc.def
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1enc.dfu)))
(/usr/local/texlive/2018/texmf-dist/tex/latex/titlesec/titlesec.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/tabulary/tabulary.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/tools/array.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/tools/longtable.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/varwidth/varwidth.sty)
(./sphinxmulticell.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/makeidx.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/framed/framed.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/xcolor/xcolor.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/graphics-cfg/color.cfg))
(/usr/local/texlive/2018/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
Style option: `fancyvrb' v2.7a, with DG/SPQR fixes, and firstline=lastline fix 
<2008/02/07> (tvz)) (./footnotehyper-sphinx.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/float/float.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/wrapfig/wrapfig.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/parskip/parskip.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/base/alltt.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/upquote/upquote.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/capt-of/capt-of.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/needspace/needspace.sty)
(./sphinxhighlight.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/kvoptions.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/etexcmds.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifluatex.sty)))))
(/usr/local/texlive/2018/texmf-dist/tex/latex/geometry/geometry.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifpdf.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/ifvtex.sty)
(/usr/local/texlive/2018/texmf-dist/tex/generic/ifxetex/ifxetex.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/hyperref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/auxhook.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/pd1enc.def)
(/usr/local/texlive/2018/texmf-dist/tex/latex/latexconfig/hyperref.cfg)
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/puenc.def)
(/usr/local/texlive/2018/texmf-dist/tex/latex/url/url.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/hpdftex.def
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty))
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/hypcap.sty)
Writing index file Tester.idx
(./Tester.aux) (/usr/local/texlive/2018/texmf-dist/tex/latex/base/ts1cmr.fd)
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1ptm.fd)
(/usr/local/texlive/2018/texmf-dist/tex/context/base/mkii/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
) (/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
(/usr/local/texlive/2018/texmf-dist/tex/latex/oberdiek/grfext.sty)
(/usr/local/texlive/2018/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg))
*geometry* driver: auto-detecting
*geometry* detected driver: pdftex
(/usr/local/texlive/2018/texmf-dist/tex/latex/hyperref/nameref.sty
(/usr/local/texlive/2018/texmf-dist/tex/generic/oberdiek/gettitlestring.sty))
(./Tester.out) (./Tester.out)
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1phv.fd)<<ot1.cmap>><<oml
.cmap>><<oms.cmap>><<omx.cmap>>
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/umsa.fd)
(/usr/local/texlive/2018/texmf-dist/tex/latex/amsfonts/umsb.fd) [1{/usr/local/t
exlive/2018/texmf-var/fonts/map/pdftex/updmap/pdftex.map}] [2] (./Tester.toc)
[1] [2] [1] [2]
Chapter 1.
(/usr/local/texlive/2018/texmf-dist/tex/latex/psnfss/t1pcr.fd) [3] [4]
Chapter 2.
[5] [6]
Chapter 3.
[7] [8]
Chapter 4.
[9] [10]
Chapter 5.
[11] [12]
Chapter 6.
No file Tester.ind.
[13] (./Tester.aux) ){/usr/local/texlive/2018/texmf-dist/fonts/enc/dvips/base/8
r.enc}</usr/local/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmmi5.
pfb></usr/local/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmsy5.pf
b></usr/local/texlive/2018/texmf-dist/fonts/type1/urw/courier/ucrb8a.pfb></usr/
local/texlive/2018/texmf-dist/fonts/type1/urw/courier/ucrr8a.pfb></usr/local/te
xlive/2018/texmf-dist/fonts/type1/urw/helvetic/uhvb8a.pfb></usr/local/texlive/2
018/texmf-dist/fonts/type1/urw/helvetic/uhvbo8a.pfb></usr/local/texlive/2018/te
xmf-dist/fonts/type1/urw/times/utmb8a.pfb></usr/local/texlive/2018/texmf-dist/f
onts/type1/urw/times/utmr8a.pfb>
Output written on Tester.pdf (17 pages, 101081 bytes).
Transcript written on Tester.log.

```