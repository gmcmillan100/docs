---
layout: page
title: grep
permalink: /grep/
resource: true
---

Recursively search through the current directory tree for a string:

```
$ cd oncall-master
$ grep -r 'Search for team names' *
src/oncall/api/v0/teams.py:    Search for team names. Allows filtering based on a number of parameters, detailed below.
```

Grepping through logs:

```
$ grep archiving atlassian-confluence.log*
$ grep archiving atlassian-confluence.log* | grep 'PRT'
$ grep -E 'plugin.archiving.service|archiving.service.support|archiving.service.replication|com.midori' atlassian-confluence* | grep 'WARN'
```

Search for the text pattern "bgp" in all files ending with the '.txt' suffix:

```
$ grep "bgp" *.txt
1.0_pubsgoals.txt:  debug ip bgp
cli_fs.txt:neighbor A.B.C.D ebgp-multihop
```

Find works in a similar way:

```
$ find . -name gre.txt -print
./.snapshot/hourly.0/src/sw/specs/routing/gre.txt
./.snapshot/hourly.0/src/sw/sw/specs/routing/gre.txt
./.snapshot/hourly.5/src/sw/specs/routing/gre.txt
./.snapshot/hourly.5/src/sw/sw/specs/routing/gre.txt
./.snapshot/hourly.1/src/sw/specs/routing/gre.txt
./.snapshot/hourly.1/src/sw/sw/specs/routing/gre.txt
./.snapshot/hourly.2/src/sw/specs/routing/gre.txt
./.snapshot/hourly.2/src/sw/sw/specs/routing/gre.txt
./.snapshot/hourly.3/src/sw/specs/routing/gre.txt
./.snapshot/hourly.3/src/sw/sw/specs/routing/gre.txt
./.snapshot/hourly.4/src/sw/specs/routing/gre.txt
./.snapshot/hourly.4/src/sw/sw/specs/routing/gre.txt
^C
```
Find all files in the 'lms-docs' directory that have a .mdx file suffix:

```
$ cd lms-docs
$ find . -type f -name \*.mdx
./explanation/ad-serving/overview.mdx
./about/intro.mdx
./about/contributing.mdx
./reference/intro.mdx
./reference/lms-org-chart.mdx
./reference/teams/eng/lms.mdx
./reference/teams/eng/adservingplatform/mvp/lmsasaplat/about.mdx
./reference/teams/eng/adservingplatform/mvp/about.mdx
./reference/teams/eng/adservingplatform/mvp/talentmedia/about.mdx
./reference/teams/eng/adservingplatform/about.mdx
./reference/teams/eng/pages/about.mdx
./reference/teams/eng/cep/about.mdx
./reference/teams/template.mdx
./reference/workinggroups/techfoundations/about.mdx
./reference/workinggroups/techfoundations/tablestakes/about.mdx
./reference/workinggroups/productivity/about.mdx
```

Word count:

Use `wc -l <filename>` to print the line count.


```
grep "0.0." mps-using-docin.txt | wc -l
72
```