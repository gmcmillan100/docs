---
layout: page
title: grep
permalink: /grep/
resource: true
---
[gmcmillan@suncs9 ~]% find . -name gre.txt -print
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
[gmcmillan@suncs9 ~]%
[gmcmillan@redd3132 ~]% cd src/sw/specs
[gmcmillan@redd3132 specs]% ls
1.0_pubsgoals.txt        atlas.docsched.fm  crash.txt           new-cd-install.txt                  sw_arch.fm
1.0_test_goals.txt       card_mgmt.txt      drivers             packaging-requirements.txt          sw_plan_1_0.txt
Atlas_sw.mpp             channelize.txt     install-howto.txt   partition-install.html              sw_plan_1_1.txt
CVS                      cli.txt            iod.txt             process_priorities.txt              sw_plan_1_2.txt
README                   cli_1_1.txt        kernel              pubs                                sw_plan_1_3.txt
ReleaseProcess.fm        cli_chips.txt      lab_assignments     restart.txt                         sw_postmortem_1_0.txt
SWDesignSpecTemplate.fm  cli_fs.txt         labdns-howto.txt    routing                             sw_routing_plan.txt
SWFuncSpecTemplate.fm    cli_how_to.txt     lynx-notes.txt      rp-packet-flow.txt                  syslog.txt
SWTestStrategy.txt       cli_new.txt        lynx3_1a_docs.html  rp_failover.txt                     systest
alpha                    code_style.txt     lynxinstall.txt     rp_redundancy.txt                   tools
apps                     common             lynxinstall3.1.txt  server_restart.txt                  ucode
atlas.docplan.fm         counter_mgr.txt    multipart.txt       server_restart_phased_approach.txt
[gmcmillan@redd3132 specs]% grep "load-interval" *.txt
[gmcmillan@redd3132 specs]% grep "bgp" *.txt
1.0_pubsgoals.txt:  debug ip bgp
1.0_pubsgoals.txt:  router bgp
1.0_pubsgoals.txt:  show ip bgp
1.0_pubsgoals.txt:  show ip bgp neighbors
1.0_pubsgoals.txt:  show ip bgp paths
1.0_pubsgoals.txt:  show ip bgp summary
1.0_pubsgoals.txt:  show ip bgp dampened-paths
1.0_pubsgoals.txt:  show ip bgp flap-statistics
1.0_pubsgoals.txt:  show ip bgp peer-group
cli_fs.txt:neighbor A.B.C.D ebgp-multihop
cli_fs.txt:debug ip bgp events
cli_fs.txt:debug ip bgp keepalives
cli_fs.txt:debug ip bgp internal
cli_fs.txt:debug ip bgp updates
cli_fs.txt:debug ip bgp errors
cli_fs.txt:debug ip bgp neighbor A.B.C.D
cli_fs.txt:show ip bgp
cli_fs.txt:show ip bgp A.B.C.D
cli_fs.txt:show ip bgp cidr-only
cli_fs.txt:show ip bgp community
cli_fs.txt:show ip bgp community-list
cli_fs.txt:show ip bgp dampened-paths
[gmcmillan@redd3132 specs]% grep "load-interval" sw_plan_1_3.txt
[gmcmillan@redd3132 specs]% grep "show ip ospf database" *.txt
1.0_pubsgoals.txt:  show ip ospf database
sw_plan_1_2.txt:   - show ip ospf database summary (1w)
sw_routing_plan.txt:   - Includes show ip ospf database summary (1w)
[gmcmillan@redd3132 specs]% 
[gmcmillan@redd3132 specs]% grep ospf !$
grep ospf sw_plan_1_3.txt
Goals: (sw/specs/routing/ospf.txt)
  - PR 979: Enhanced context help for ip ospf cost, dead-interval,
  - PR 2506: Send hello packet faster when ospf enabled. [DONE]
- PR 2507:  Enhanced 'debug ip ospf adjacency'.  Make hellos distinguishable
- PR 2408:  Debug ip ospf adjacency should only display adjacency debugs.
[gmcmillan@redd3132 specs]% 
[gmcmillan@redd3132 ~]% grep "load-interval" *
grep: desktop: Is a directory
grep: doc_plans: Is a directory
grep: emacs: Is a directory
grep: fminit: Is a directory
grep: mail: Is a directory
grep: Mail: Is a directory
grep: My Documents: Is a directory
grep: notes: Is a directory
grep: ns_imap: Is a directory
grep: nsmail: Is a directory
grep: office52: Is a directory
grep: presentations: Is a directory
grep: Procmail: Is a directory
grep: READMEs: Is a directory
grep: src: Is a directory
grep: ssh.windowsx: Is a directory
grep: trash: Is a directory
grep: visio-graphics: Is a directory
grep: webpage: Is a directory
grep: Windows: Is a directory

