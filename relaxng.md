
                        RELAX NG
                        --------

Introduction 
------------ 
RELAX NG (RNG) is an XML schema language. It offers the following functions
and benefits:

o Validates the structure of XML documents
o Easy to learn, read, and write
o Describes virtually any vocabulary that is based on well-formed XML
  1.0 and namespaces in XML
o A concise compact syntax (and XML translation mechanisms)

Example
-------
element resume { 
  element name { text },
  element address { text },
  element home-phone { text },
  element cell-phone { text }+,
  element email-address { text }*
}


Translation of Compact Syntax
-----------------------------
Use the Trang program to translate RNG into other schema languages
such as W3C Schema and DTDs. 

Docs
----
Compact Syntax:
http://infohost.nmt.edu/tcc/help/pubs/rnc/


http://relaxng.org/compact-tutorial-20030326.html 
