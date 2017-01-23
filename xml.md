
                  XML Project Plan
                  ----------------

Contents:

1.0  Purpose
2.0  XML Overview
3.0  Motivation and XML Benefits
4.0  Phased Approach
      4.1  Phase 1--Research and CSS Testing
      4.2  Phase 2--Low Cost XML Testing
      4.3  Phase 3--Equipment Evaluation and Purchase
      4.4  Phase 4--Trial Book Conversion
      4.5  Phase 5--Browser Testing
5.0  Design Issues and Tradeoffs
6.0  Costs
7.0  Schedule
8.0  Headcount and Maintaining the System
9.0  Notes from Meeting with Juniper XML Tools Person
10.0 References
11. DocBook Tips

---------------------------------------------------------------------

1.0  Purpose

To evaluate Extensible Markup Language (XML) technologies and choose
the best implementation for Procket Technical Documentation. 


---------------------------------------------------------------------
2.0 XML Overview
      
XML is a general purpose information storage system, markup language
toolkit, open standard, and collection of other standards used to
author and manage technical documentation.  

XML itself does not DO anything. XML was created to structure, store,
and send information.

References:

WC3 XML Recommendation
http://www.w3.org/TR/2004/REC-xml-20040204/

What is XML?
http://www.xml.com/pub/a/98/10/guide0.html

James Clark is one of the early pioneers of SGML and XML. 
Created the best parsers, validators, and SoftQuad.
http://www.jclark.com

---------------------------------------------------------------------
3.0  Motivation and XML Benefits


Figure 1: Many Output Options

                                         |---->html
                                         |
                                         |---->pdf
 +----------+     +----------------+     |
 |source db |---->| transformation |---->|---->text (grep command lookup)
 | content  |     |    engine      |     |
 +----------+     +----------------+     |---->msword (roll your own docs)
                                         |
                                         |---->postscript (for printer)
                                         |
                                         |---->wireless (cell/pda)
                                         |
                                         |---->speech recognition
                                         |
                                         |---->language translation
                                         |
                                         |---->future


Figure 2. Write Once; Update Many

  +---------------+         |----->book 1
  | one paragraph |-------->|
  | changes       | update  |----->book 2
  +---------------+         |
                            |----->online 1
                            |
                            |----->online 2

The ability to update documents in many places (receivers) when data
sources have changed. 

- Online command lookup per software release. It's a lightweight html
  web page with hrefs to command reference pages. It will help online
  users easily find command descriptions.

- Helps writers accurately update and manage massive amounts of syntax
  examples. Command syntax is always changing. Applies to quality
  control and man hours spent on the docs. 
 

---------------------------------------------------------------------
4.0  Phased Approach

4.1  Phase 1--Research and CSS Testing

  o Purchase several XML books
  o Experiment with CSS. Content vs Presentation.
  o Start the XML Project Plan

4.2  Phase 2--Low Cost XML Testing

  o XMLSpy. Basic tutorial. Created schema, xml file, transformed into
    html. Initial impressions: The authoring environment is difficult
    to work in. Not WYSIWYG at all. Too many windows. Switching views
    in the main area is a good feature, especially the text
    view. Having a built in transformation engine was handy. I like
    pressing F10 and F8 to transform or validate a file. So far don't
    see a content repository or a solution for a multi-author
    environment where multiple "books" share the same content.

    Note: I liked how xmlspy auto inserts the end tag. There's no find
    and replace feature in text view (unlike Framemaker). I like the
    command completion feature while manually editing text.

  o PSGML. Decided not to use it. Hasn't been updated in 3 years. No
    support for Schemas. 

  o nXML mode. An emacs plugin (similar to psgml) that uses Relax NG
    schema language http://www.thaiopensource.com/nxml-mode/
    http://www.relaxng.org/

    Note: Arbortext claims it does not support Relax NG

    After that, might use:

       Xerces, http://xml.apache.org/

    Language creation and resume conversion. 

  o Daniel Veillard's xmllint and xsltproc. Relax NG-aware processing
    applications. Code is provided in the libxml2
    (http://xmlsoft.org/) and libxslt (http://xmlsoft.org/XSLT/)
    distributions


  o Test 3. DocBook 



4.3  Phase 3--Equipment Evaluation and Purchase

Editing Tool     Cost      Platform Supported
---------------------------------------------
psgml emacs      free      Unix
XML spy          $200      
Morphon          $150
Epic*            $700      Unix/Windows
Xmetal*          $500      Windows

* = A suite of editing systems for high-end formatting and
collaboration. Procket most likely needs. 

IE 5.1 and above is a good XML viewing tool. IE also contains an XSLT
transformation engine. However, it's too risky to serve XML documents
and expect end user clients to format them correctly. Therefore, at
the moment, it's safer to do the transformation on the server side
and just serve HTML. 

CSS is good for displaying formatted documents on computer
terminals. However, only CSS1 is widely implemented. Forget about CSS2
and CSS3.



4.4  Phase 4--Trial Book Conversion

4.5  Phase 5--Browser Testing

IE 
Netscape
Opera


---------------------------------------------------------------------
5.0  Design Issues and Tradeoffs

Consider the following when choosing an editor:

  o Weigh the benefits of enforced structure (see Xmetal) against the
    interruptions in the creative process (ArborText's Epic).

  o A specialized table editor is a godsend. Tables in XML are complex
    structures. They are not fun to work with in markup. 

  o PDF generation. High quality PDF is difficult to achieve. Epic
    uses FOSI while XML Spy uses XSLT. 


With XML there's a more compelling
reason to do away with the "first instance" standard to any of our
guidelines. Our audience in many cases will not read the doc in
order in hardcopy or in XML chunks. 

Chunking Awareness and Tagging Methodology

Hidden Proprietary Coding. Truly Exchangeable?

Vendor Dirty Laundry and Bugs: What doesn't work?

In-House Expertise vs Professional Services


---------------------------------------------------------------------
6.0  Costs

     Phase  Date Completed
     =====================
     1      3/19
     2      
     3
     4
     5

---------------------------------------------------------------------
7.0  Schedule

consulting 

---------------------------------------------------------------------
8.0  Headcount and Maintaining the System


---------------------------------------------------------------------
9.0  Notes from Meeting with Juniper XML Tools Person

I)

XML RESEARCH--JUNIPER TOOLS (BRENDA, LIZ)
1/14/2004

Juniper Contacts -- XML Research
	* Liz (liz@caltonia.com)
	* Brenda Dupolin (brenda.dupolin@juniper.com?)
	* Lunch 11:30 at Macaroni Grill, Milpitas

Application:
	* Arbortext Epic (Headquartered in Michigan)

Other Apps Considered:
	* Documentum
	* Lightspeed
	* Zyvision (used primarily for magazine and .pdf output)
	* Arbortext (best app for .pdf output)

Arbortext Epic:
	* Performance suffers over DSL
	* Supported on Windows, Solaris, <another environment>
	* Arbortext Epic export Formats:
		- Word translation format (RTF)
		- HTML
		- PDF
		- Palm
		- TXT
	* Cost: 
		- Arbortext $680/seat for 1 year
		- $300/seat annual renewal fee
	* Arbortext Conference in Atlanta May 2004
	* Training classes in Michigan

Free Applications:
	* There are freeware existing, but they are only for the
front-end 
	authoring of XML code (XV, EMACS, etc.)
	* Arbortext Epic has available free trial edition.

Juniper resources to convert to XML:
	* Arbortext, when they merged with another company
	* Oracle, was adopted internally when XML conversion initialized
	* Liz support from 11/2000 to 1/2004 as XML Tools support (FT?)
	* Brenda part of Dev team 11/2000 to 1/2004
	* They have not converted all docs
	* All writers author in XML

DTD Applications and Creation
	* XXL (?) is used for style templates
	* FOSI (Formatting Output Specification Instance)
	* This is not a Wysiwyg application

"Chunking"
	* Chunking is defined by the person inputting content
	* Chunk of information can as small as a single word
	* Passages of text and/or illustrations can be "swapped out"
	for the export of differing docs

XML Training:
	* Costs $100/hour
	* Using outside vendor may not get us exactly what we want
	(using inside staff enables a finer definition of our needs)
	* Liz recommends taking Arbortext training classes
	* Training classes provides the app's *real* capabilities and
	limitations

Content Management apps:
	* Oracle (we already have)
	* IFS
	* Interwoven Teamsite (used by Juniper), able to display change
	history; this function may not be available on comparable apps
	* CVS is the low-cost solution

Exterior Search Engine:
	*This is the search tool that enables customers to search
through
	Juniper's doc content
	*Inktomi (used by Juniper)
	* Liz is satisfied by Inktomi's performance

Sharing Docs With Training:
	* Juniper doesn't share content with their Training dept
	* Power Point conversion to XML is not pretty

Reference Material:
	* XML Overview:
http://www.simultrans.com/seminars/seminar200006.htm
	* Arbortext: http://www.arbortext.com/
	

II. 

Email from Brenda at Juniper

From: "Brenda DePaolis" <brenda@juniper.net>
To: "Greg McMillan" <gmcmillan@procket.com>
Subject: Papers From Liz
Date: Wed, 14 Jan 2004 13:36:10 -0800

Hi Greg,

Thanks for lunch. It was great talking to you and Clyde. The freeware that a friend of mine is using is called XMLmind. Here's a link: http://www.xmlmind.com/.


Here's the papers that Liz wrote:

Beyond Theory: Making Single-Sourcing Actually Work 
ACM SIGDOC 2003
Oct 12, 2003, San Francisco, CA
Full Paper, (PDF)  http://www.caltonia.com/pres/p25-fraley.pdf
Presentation Slides, (PDF) http://www.caltonia.com/pres/sigdoc-2003oct13.pdf


Branched Libraries and Rapid Release Single-Source Environment Implementation 
Arbortext International User Group Conference (AUGI) 2003
May 16, 2003, San Antonio, TX
Initial Abstract (PDF)  http://www.caltonia.com/pres/augi-2003-abstract.pdf
Presentation Slides, (PDF)  http://www.caltonia.com/pres/augi-2003-abstract.pdf

----------------------
Brenda DePaolis
Technical Publications
Juniper Networks, Inc.	             
(408) 936-2441


---------------------------------------------------------------------
10.0 References

XML Basics
http://infohost.nmt.edu/tcc/help/xml/

PSGML for Emacs
http://www.lysator.liu.se/~lenst/about_psgml/

James Clark's NSGML cli error checker
http://www.jclark.com/sp/

http://www.webstandards.org/

http://www.webreview.com/

Regarding Arbortext Epic:

- Noticed how their "Specifications" page looks so much like a Cisco html document.

- We discovered Epic also runs on Solaris

- As far as handing graphics, it does not support EPS but only
EPSF, which the current version of A.Illustrator no longer
supports. The difference between the two formats it that EPSF
has on top of the EPS code an additional 1-bit raster 
interpretation of the graphic for Wysiwyg display

Epic's overview and other links:

http://www.arbortext.com/frame.htm?wstat=0&curl=http://www.arbortext.com/html/epic_editor_overview.html&ms=349


11. DocBook Tips

Getting started:

(1) Install Java version such as 1.3 or 1.4
(2) Install Apache Server
(3) Install Xalan & Xerces Parser & XSL Processor
(4) Download DTD & Stylesheets
(5) I then created scripts that referenced the correct Java Environment
DTD, HTML, and XSL
 