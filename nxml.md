---
layout: page
title: nxml
permalink: /nxml/
resource: true
---

Overview 
-------- 
A new mode for editing XML documents from within GNU
Emacs. It's a milestone in that it's the first open-source editing
application to enable context-sensitive validated editing against
Relax NG schemas. It also provides a clever mechanism for real-time,
automatic visual identification of validity errors, along with
flexible syntax-highlighting capabilities


Emacs Installation
------------------
;; Add the nxml files to emacs's search path for loading:
(setq load-path
      (append load-path
              '("/usr/nxml/nxml-mode-20041004/")))

;Automatically load nxml-mode each time I start Emacs. Note that
;rng-auto.el does not load all of the nxml-mode code; it merely sets
;things up so that all the features of nxml-mode will be autoloaded
;properly.

(load "/usr/nxml/nxml-mode-20041004/rng-auto.el")

;Use nxml-mode automatically for files with an extension of xml,
;xsl, rng or xhtml.

(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
            auto-mode-alist))

;completes the tag when you type '</'

(custom-set-variables
'(nxml-slash-auto-complete-flag t))


Validation 
---------- 
Normally, as soon as emacs associates your document with a schema,
nxml-mode constantly validates your document against the schema with
every keystroke.

If validation is in effect and your document is not valid against the
schema, the point where the document becomes invalid is shown with
thin red underlining.


Schema Association 
------------------ 
Because going DTD-less means that you can also go without DOCTYPE
declarations in your documents, and because the Relax NG specification
does not mandate any way for associating a document with a Relax NG,
some mechanism needs to be provided at the editing application level;
Emacs/nXML provides two mechanisms: one for manually specifying a
Relax NG schema by browsing for it on your local filesystem, and one
customizable mechanism for automatically associating a document with a
schema.

The schema auto-association mechanism works by looking at the filename
extension of the document (it's configured by default to do it for
.html, .xsl, .rdf, and .rnc files), or failing that, by looking at the
document's root element (for example, it's configured by default to
associate the DocBook schema with documents that have book or article
root elements, the XSLT schema with documents that have stylesheet or
transform root elements, etc.)

http://infohost.nmt.edu/tcc/help/pubs/nxml/ar01s05s01.html

C-c C-w    Asks what schema you are using. If your document is connected
           with a schema, the path to the schema appears in the
           minibuffer. If no schema is in effect, you will get the
           message "Using vacuous schema"

M-x goto-char   Read a number n and move point to buffer position
                n. Position 1 is the beginning of the buffer.

Procedure:

Create a schema location file (schemas.xml) in same the directory containing
the document (test.xml). The location file looks like this:

      <?xml version="1.0"?>
      <locatingRules xmlns="http://thaiopensource.com/ns/locating-rules/1.0">
        <uri resource="test.xml" uri="test.rnc"/>
      </locatingRules>

Notice the location file contains the line:

       <uri resource="f" uri="s"/>

It means associate XML file f with schema file s. 

In this example, the "test.rnc" file contains this:

      element resume { 
        element name { text },
        element address { text },
        element home-phone { text },
        element cell-phone { text },
        element email-address { text }
      }

Note: The file kept reporting errors for the longest time because I had
an extra "," at the end of the line "element email-address { text }".


Face Customizations
-------------------
change attribute names to be different, which you can
do by changing these for example:

nxml-attribute-prefix-face
nxml-attribute-colon-face
nxml-attribute-local-name-face



Resources
---------
Code at http://thaiopensource.com/download/

Documentation:

http://infohost.nmt.edu/tcc/help/pubs/nxml/index.html

http://www.thaiopensource.com/nxml-mode/

http://www.dpawson.co.uk/relaxng/nxml/

Problems and Futures:
http://groups.yahoo.com/group/emacs-nxml-mode/

Next, tips on linking a rng schema to a document:
http://www.advogato.org/person/jamesh/diary.html?start=158
