---
layout: page
title: XSLT
permalink: /xslt/
resource: true
---

Introduction
------------
Extensible Stylesheet Language for Transformations (XSLT) is a
programming language optimized for transformation. XSLT stylesheets
are used by XSLT engines to transform one XML document into another
document (html, pdf, doc, text, ...). In the transformation process,
according to instructions in XSLT, the XSLT engine selects content
from the XML source, and places it in the output document.


Concepts
--------
An XSLT engine takes two things as input:

o An XSLT stylesheet to govern the transformation process
o An input document called the source tree. The output is called the
  result tree.


XSLT Engine 
----------- 
It reads in the XSLT stylesheet and caches it as a lookup table. For
each node the engine processes, it will look in the table for the best
matching rule to apply. The rule specifies what to output to build its
part of the result tree and also how to continue processing. Starting
from the root node, the engine finds rules, executes them, and
continues until there are no more nodes in its context node set to
work with. At that point, processing is complete and the XSLT engine
outputs the result document. 




 How XSLT works:
          
 xslt/html stylesheet----->xslt engine---->html output
                                ^
                                |
                                |
                          xml documents
                                |
                                |
                                v
 xslt/xsl-fo stylesheet----->xslt engine---->xsl-fo---->fo engine----->pdf output