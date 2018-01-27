---
layout: page
title: diff
permalink: /diff/
resource: true
---
Diff analyzes two files and prints the lines that are different.

Syntax:

```
diff file1.txt file2.txt
```

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