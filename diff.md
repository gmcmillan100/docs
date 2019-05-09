---
layout: page
title: diff
permalink: /diff/
resource: true
---
Difference (diff) analyzes two files and prints the lines that are different.

Diff tells us which lines in one file have is to be changed to make the two files identical. Diff uses certain special symbols and instructions that are required to make two files identical. It tells you the instructions on how to change the first file to make it match the second file.

Special symbols are:

* a : add
* c : change
* d : delete

Syntax:

```
diff [options] file1 file2
```

Example:

```
$ diff f-april-19-clean f-may-6-clean
7a8
> alfresco-app
19a21
---
```
The first line of the diff output will contain:

* Line numbers corresponding to the first file
* A special symbol
* Line numbers corresponding to the second file

In our case, 7a8 which means after lines 7 you have to add `alfresco-app` to match the second file line number 8. It then tells us what those lines are in each file preceeded by the symbol:

* Lines preceded by a < are lines from the first file.
* Lines preceded by > are lines from the second file.
* Next line contains `19a21` which means from line 19 in the first file needs to be added to match line number 21 in the second file. It then tells us those lines with the above symbols.
* The three dashes (`---`) merely separate the lines of file 1 and file 2.



Example:

```
$ diff docin_trunk/docin/docs/pages/autodoc.rst docin_trunk_OLD/docin/docs/pages/autodoc.rst 
130,131c130,133
< * `SRE Oncall Open Source <http://oncall.tools/>`_
< * `SRE Iris Escalation System Open Source <http://iris.claims/>`_
---
> * autofalcon, `SRE Oncall Open Source <http://oncall.tools/>`_
> * autofalcon, `SRE Iris Escalation System Open Source <http://iris.claims/>`_
> * autoflask, `Autoalerts StateDB <https://tools.corp.linkedin.com/apps/tools/product-dashboard/multiproducts/autoalerts-statedb#documentation>`_
> * automodule, `Lipy Impact Processing <https://tools.corp.linkedin.com/apps/tools/pd-data-service/api/report_data/lipy-impact-processing/apidoc/report_file/html/lipy-impact-processing-buildDocsHtml/observing.html>`_
```

The first line of the diff output will contain:
* Line numbers corresponding to the first file
* A letter (a for add, c for change, or d for delete)
* Line numbers corresponding to the second file

https://www.geeksforgeeks.org/diff-command-linux-examples/