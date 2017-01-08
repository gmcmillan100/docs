$Id$

Technical Documentation	            			Greg McMillan
Personal Draft: For Greg's Eyes Only			Procket Networks
Expiration Date: Who knows ...


                 IP Routing and MPLS Hot Talk, Tips, and Trends
                 ----------------------------------------------


Table of Contents

      1   IP Routing Terms and Routing 101 Basics
      2	  Why Route Optimize Using CSPF and MPLS?
      3	  Motivation for TE and QoS
      4   ATM
      5	  IGP Notes
      6   Link Types & DRs/Pseudo Nodes
      7	  Packet Classifications
      8	  IPv6 Notes
      9   IPsec VPNs, CPE, RFC 2547
     10	  Future Network Architectures, Pains, and Trends
     11   Wireless
     12   Netheads vs Bellheads
     13   Packet Network vs Circuit Network
     14   VoIP vs POTs vs Cell Phone
     15   Enterprise Market
     16	  SW Release Maintenance Issues
     17   Multicast Test Scenarios, Demo Setup, and Troubleshooting Tips
     18   BGP History 
     19   ASIC vs COT
     20   Multicast Initiative and Applications
     21	  Growth of the Internet
     22   Forklift Upgrades
     24   Multicast vs MPLS
     25   Procket Close Out
     26   Packet Processing

1 IP Routing Terms and Routing 101 Basics

tli

First, IP was designed to survive nuclear attack in DoD networks. It
was NOT designed for the enterprise network. Second, in any well
designed IP network, there are also redundancies. The redundancy
strategy is typically very different, but when well executed provides
a service that is quite robust.


a) IP Routing Terms

Networks, subnets, and hosts. To break an IP address up into those
parts, you must use a Subnet Mask. There are special broadcast
addresses that you must avoid assigning to hosts. 

When Device A opens a tcp connection to Device B, Device A's IP
address is used as the source address to send packets from Device
A to the destination address assigned to Device B. The
source/destination is swapped when packets flow in the opposite
direction. 

Term	Example		Description
---------------------------------------------------------------------
prefix	10.2.2.0/24	A dotted decimal representation of an IP
			network specified as an IP network address 
			and mask-length pair. 

			A prefix is a network address destination,
			which is a string of common bits in a set of
			addresses. For example 10.2.2.0/24 is a
			prefix. It denotes all IP addresses that start
			with the first left-ordered 24 bits set to
			"10.2.2". 

			Do not call a prefix a host IP address. For
			example, you would not refer to San Jose as a
			person's home address. Instead, a complete
			street name is a person's home address (a host
			IP address).

			Note: Network engineers often interchange the
			terms "prefix" and "route." For example,
			40,000 prefixes in BGP is often referred to as
			40,000 routes in BGP.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mask      /16		The number of bits used from the host portion of a classfull IP	
length    or ...	address to create a subnet address.

	  255.255.0.0	The mask length specifies the number of bits that are relevant
	  or ...	in a network prefix.

	  11111111.11111111.00000000.00000000

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
route			A route describes the path to reach a
			destination prefix in a Routing Information
			Base (RIB), which is often called a routing
			table.

			A route consists of a prefix describing the
			destination plus one or more paths to get to
			that destination. A path in the routing table
			consists of an outgoing interface plus a
			next-hop IP address.

			A route is the complete list of information
			that is required to get an IP packet out of a
			device. The prefix defines the destination;
			the path describes the next-hop router to
			reach the destination. 

			A router looks up the route based on the
			destination IP address in the packet. A route
			describes the next-hop IP address, layer 2
			address (if applicable), and a specific
			interface to send a packet out of.

			Note: Engineers sometimes refer to a "route"
			when they  mean a "path." The terms "route"
			and "path" are sometimes used differently when
			describing route computations, such as SPF.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
host 
IP address   10.1.3.1	A four-byte dotted decimal notation IP address assigned to a host.
			To add extra clarity in the command reference pages, consider using
			the variables <host-ipaddress> or <network-ipaddress> instead of
			<ip-address>. "Host" refers to one router; "network" refers to a huge
			address range that contains many hosts.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
network 
number	     10.1.0.0	In most cases, avoid using the term "network
number.	     		Classless networking". Use the terms "prefix" or "host
			IP address" instead.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
subnet	     10.1.0.0	A term that usually refers to setting up an
			internal network. Subnetting is the act of
			creating little subnetworks from a single,
			large parent network.



b) Routing 101 Basics


An IP route lookup describes how a router looks up a route based on a prefix.

From Srihari:

		 input interface
			|
			|
		+---------------+
		|		|
		|    Router	|
		|		|
		+---------------+
			|
			|
		 output interface

An IP packet is a stream of bits containing the following fields:


	+--------------------------------------+
	| MAC address | IP header | IP payload |
	+--------------------------------------+


A router has a routing table:

		+-----------------------------------------+
		| Destination prefix | Outgoing interface |
		|		     |			  |	
		-------------------------------------------
		|  10.1.0.0/16	     |  interface e1/1/1  |	
		|		     |			  |	
		-------------------------------------------
		|		     |			  |	
		|		     |			  |	
		-------------------------------------------
		|		     |			  |	
		|		     |			  |	
		-------------------------------------------

- After the packet comes into the router, the router removes the
  incoming MAC address (layer 2) then looks at the IP header. 

- The MAC address is required for the packet to reach the router on a
  specific interface. 

- The IP header contains the source address and the destination prefix. 
  
- The router looks in the routing table for the outgoing interface
  information for the IP header. 

- After that information is found, the router applies the
  corresponding MAC address for the outgoing interface. 

- The router gets the packet, looks at the destination prefix, looks
  at the routing table for the match, and sends the packet out the
  outgoing interface. 

From rex:

A router has three types of databases:

  - A protocol Routing Information Base (RIB). Each routing protocol has
    one of these. Each of the routing protocols has to discover the
    network. They need to know how the network is organized. They have
    to source some information. That information is sourced in a
    protocol RIB. IS-IS and OSPF have their own protocol RIBs. They
    are called Link State Databases. BGP has its own RIB. It's called
    TCP RIB. The RIBs store the destination, path, and other
    information. There could be multiple entries in the URIB. The
    "other info" helps the protocol decide one path over the other to
    reach a destination. Each of the protocols has a different "other
    info" entry. This "other info" is different for each protocol and
    so is the decision algorithm. 

  - Unicast RIB (the routing table)

  - Forwarding Information Base (FIB). Or "forwarding table". Used for
    actually forwarding the packets. Has destination and nexthop
    information. Used for packet forwarding. Used every time the
    router gets a packet. 

Each of these protocols finds paths to reach destinations, and the
protocols insert those paths into the Unicast RIB. Each of the routing
protocols then calculates the routes (nexthops) for destinations and
inserts them in the URIB:

                       RIB--->URIB 

For example, IS-IS and OSPF calculate paths from sources to
destinations within a routing domain. Then, they will install those
paths into the URIB. BGP is a protocol used across routing domains to
calculate paths from sources to destinations. 

Once this information is calculated by the routing protocols, they
will install it in the URIB, and the URIB passes this information
(routes) to the FIB:

                       URIB--->FIB

The FIB forwards entries to the destination nexthop. There are
multiple possible paths for sources and destinations in the URIB. When
you install it in the FIB, the FIB installs the nexthop corresponding
to the path it has chosen. That is, the nexthop that the packet must
take to reach the destination. The FIB is implemented in the hardware
to get maximum performance.

Process Communication Flow:

Example. We have a routing protocol called OSPF. We have a routing
table manager called URIB. We have a software forwarding module called
IP. When we're doing software switching, packets are coming in out of
IP, IP says here's a packet, IP looks up the destination address in
the routing table, an IP forwards the packet.


2 Why Route Optimize Using CSPF and MPLS?

tli

You need to optimize because bits are not free. They are exceedingly
cheap, but that is only because you gain great economies of scale in
aggregating them. You want to optimize because you do not want to
light transcontinental fiber if you do not have to. Suppose that the
traffic in your network from IAD to SFO fills an OC-192c plus an extra
100Mbps. Do you light a full fiber to carry that extra 100Mpbs?
Wouldn't you rather send that data around another, longer, existing
path to get to the same place?

MPLS-TE works best when the route computation is done offline by a
centralized optimization algorithm. The optimal arrangement of traffic
in a network is a non-trivial problem, and it requires global
information. Such techniques have been used by telcos for years for
the optimization of the voice network. The same algorithms apply to
data and result in similar benefits. Thus, the result is a set of
precomputed explicit paths for each LSP in the TE network. The
mechanisms in the protocols to perform CSPF can also be used in cases
where optimality is not a requirement, or in cases where a node is not
preconfigured with an appropriate fallback path for a particular set
of failures.

A popular way of using TE is to run most of the network just on the
IGP and then to install LSPs to deal with the observed congestion
points. This type of exception deployment also wants to be able to use
routing for path computation because the operator wants to specify the
minimal number of constraints on the LSP and then have the network
figure it out.

In the TE application, the LSP is a single persistent connection that
carries aggregated traffic from carrier edge to carrier edge. Once
established, it has an indefinite lifetime; the overhead of the
connection is well amortized.


3 Motivation for TE and QoS

tli

The only part of the network that needs to implement QoS is at the
points of congestion.

a)

MPLS enables the TE capabilities present in a connection oriented
architecture to be absorbed into routers. In addition to TE, MPLS also
enables carriers to provide FRR and improve their profitability
through higher network utilization. Some carriers believe that a FRR
capability is a necessity for carrying VoIP traffic. These carriers
want to preserve the protection that they have in a SONET
architecture. 

IP unicast routing protocols are not very good at making use of all
the available bandwidth. Instead they focus on the shortest path,
which can easily lead to unnecessary congestion issues. Big networks
feel an amplification of this pain and are precisely the networks that
requested the development of TE capabilities.

In an IP network, you can optimize your connections until your
Interior Gateway Protocol (IGP) gives you a localized point of
congestion. However, at that point, the IGP will not provide you with
the flexibility to precisely place traffic on the various paths of the
network. It requires more granularity that is simply unavailable
without TE. 

A typical network (IP or phone) will have a traffic demand matrix. Put
input cities on one side and outputs on the other. Some amount of
traffic is exchanged between these, and carriers need to provision
bandwidth to carry this traffic.

b)

 So let me see if I can further enliven this discussion with a rationale
 for why QoS for MPLS and for IP is really unnecessary except for
 jitter-sensitive services.

 Today, the SPs are in a position where they need to have market
 share and they must simultaneously make their operations more
 efficient so that they can achieve profitability. To have the
 economies of scale, these SPs need to have traffic volume and
 today that implies that they have to provide a best effort service.
 However, coupled with that, they must also provide a competitive
 best effort service. This implies that the best effort network must
 NOT congest in any significant way. Certainly customers who see
 significant packet loss for extended durations will simply find
 another SP.

 If the network is sufficiently provisioned such that best effort is not
 congested, then what does QoS ever buy you? All of your packets
 will get through, it's only a matter of whether or not you want your
 packets to go to the head of the queue.

 If you have a jitter sensitive application, then obviously this is of
 some value to you. However, for all other traffic classes, you end
 up paying for something for which you get no real value in return.

 While PT Barnum might be content to take this money indefinitely,
 most consumers will eventually figure out that they are paying for
 no return and move elsewhere, so the SP is not likely to continue
 this behavior for too long.

 Thus, there are effectively only three real classes of service that a
 SP needs to maintain:

     - network control traffic (routing, link layer, management)
     - jitter-sensitive traffic (VoIP)
     - best effort

 Based on this, I'd say that six levels of service is overkill. ;-)


c)

  Frankly, I cannot guarantee you anything about what I was thinking
  in 1999. But yes, I would definitely consider IP the connectionless
  part and MPLS as the connection-oriented part of the architecture.

d)

 The requirements that are placed in front of me are all about VoIP,
 where the guarantees are not as "hard" as the ones that you're
 apparently seeing.

 In any case, MPLS implementations can certainly differ and there is
 no defined service requirements for any particular EXP code points,
 just as with DiffServ. If someone felt that they needed to provide
 "hard" guarantees, they are more than welcome to do so. This is a
 system architecture question, not a protocol definition issue.

e)

 There is no free lunch. The right answer is to make tradeoffs
 between scalability, precision, and cost.

 When traffic is aggregated, the granularity of "true, hard" QoS is
 extremely painful to support. Do you really want to support per-flow
 queueing in the middle of the Internet? Do you really want to open up
 4 VC's everytime someone clicks on a web link?

 Scalability comes from aggregation and abstraction, and that is in
 direct conflict detailed packet handling. Such detail is highly
 appropriate in a congested access network. The core, however, is
 less likely to congest and is also going to be unlikely to do
 anything meaningful other than to deny service to a large traffic
 aggregate. As such, the additional granularity is of no benefit.

f)

 I think that most folks do realize that jitter and latency
 still matter on an OC-192. I think what they're really trying to say is
 that it is not difficult to meet those criteria at that speed because
 the transmission time of the packet already in flight is so short. No
 point in turning down the MTU here, because the size of the packet
 is not an issue.

g)

 Another frustration on the vendor side is the percentage of
 customers who have made a corporate decision to sell QoS
 services, but have not bothered to define a service model. The
 result is inevitably friction between the customer's engineering and
 marketing, with both sides happy to point fingers at the equipment
 vendor.

h)

Comment based on http://www.cs.wisc.edu/~plonka/netgear-sntp/

If they had a Procket system as their edge router and we were done
with the QoS code, we would be able to rate limit NTP requests to that
IP address down to something paltry.  This would be the best possible
endgame as the time server would simply 'disappear' while it was under
attack, the load on the server would be capped, and reliable service
would automatically return once the 'attack' subsided.

The place to put the Procket box is the edge router in their
ISP.  All DoS attacks have to be blocked in the ISP.  The
point is that we could shape the specific Netgear attack
traffic down to a trickle, allowing the server to deal with
legit traffic.


i)

Have you found an enterprise that is willing to pay more than PSTN
rates for VoIP? I'm sure that the answer is 'no'. ;-)

Yes, overprovisioning costs money. Yes, there is a cost/quality
tradeoff to be made and I'm fine with that. The point that I'm trying
to get across to folks is that different consumers will be at
different points on the cost/quality curve. There is an ongoing myth
that VoIP can only exist at the PSTN quality level and folks need to
understand that not all consumers are at that price point. 

Or, to put it another way, would I pay $0.01/min for VoIP long
distance instead of my current telco rates? Yes. 

Voice service is no longer a monopoly. Multiple service grades are an
expected outcome of competition. Deal.

j)


GMPLS will be found to be too complicated and will be replaced by
a simplified peer model. My issue is with GMPLS in specific. I have no
issues with the fact that there is a need for a function here. My
issue is with having an overlay model vs. a peer model. 

Yes, the peer model creates more "routers" but allows the routers
to peer into the optical topology. If the point of using this type of
dynamic mesh is to provide traffic engineering, then all that the
overlay model does is to hide the topology from the routers that
have the demand matrix. This makes it very hard to begin to solve
the global traffic optimization problem.

The current overlay model creates complexity because it abstracts
out optical topology from other layers. That abstraction hurts
optimality, but provides scalability. Unfortunately, at the level that
we're playing at, it's my gut feel that optimality is more of a
driving issue.

There will be another round of greenfield CLEC's who will compete
primarily using IP and VoIP. This time, instead of a land-grab
business model, they will focus on early adopters and a
pay-as-you-grow strategy.

CPE VPNs will finally catch on, putting L2 and L3 PPVPNs out of favor.

With respect to VoIP, yes, the CLEC would have to compete
against POTS, primarily on price. However, I believe that there is a
non-trivial market in providing VoIP to businesses, replacing T1's
and PBX's and Centrex. It's not really my area, but it's pretty clear
that there's gotta be a better way. UUnet cleaned up by selling T1's
for Internet access. Someone else, with the right model, can do the
same for VoIP.


4 ATM

tli

  MPLS will not ever match ATM's QoS guarantees. But, are
  those guarantees really necessary? An effective QoS scheme may
  be far simpler than what ATM presents us with. Unless you're
  interested in the academic side of the equation, the pragmatic
  engineer needs to concern himherself to fulfilling the real
  requirements placed on the network.

  Right now, those requirements are to minimize but not eliminate
  jitter and to bound latency. In a packet network, this is reasonably
  done by giving these packets high priority as part of the queueing
  discipline and a shortened queue length (as compared to best effort
  traffic). MPLS EXP bits can be effectively used to provide the
  marking information necessary to differentiate such packets. So, for
  all practical purposes today, meeting practical requirements is not
  hard.

Note: If you want to argue about the efficiencies of cells, you
have to take the cost of inefficiency into account. If you want to
send a cell across an electrical backplane, you need to provision a
certain amount of excess capacity on that backplane. This is
relatively cheap. If you want to send a cell across a LH network, then
you have to provision that extra inefficiency in LH bandwidth. That's
expensive. Cells are agnostic. They have advantages and disadvantages. Folks who
have a religion and don't evaluate technology on its true merits are
condemned to preach forever.

For its internal cell switching, a Procket router does not use ATM
53-byte cells. Procket's cell size is 30 Bytes of payload plus
overhead. This size efficiently uses Dynamic Random-Access Memory
(DRAM) bandwidth and avoids IP fragmentation overhead. Unlike a
Procket router, when cells are much larger than the packets getting
presented, DRAM bandwidth is wasted.


5 IGP Notes


a) Rajesh per OSPF:

For an ISIS LSP that contains
   Prefix 10.0.0.0/8
   Prefix 11.0.0.0/8
   Prefix 12.0.0.0/8

the equivalent in OSPF will be ..

OSPF LSA1
   Prefix 10.0.0.0/8
OSPF LSA2
   Prefix 11.0.0.0/8
OSPF LSA3
   Prefix 12.0.0.0/8


Typically, OSPF LSA's carry information about 1 prefix. While ISIS LSP's
typically carry information about multiple prefixes.

This is not true in all cases but true for most cases in OSPF.


b) Venu per ISIS


At a high level, LSAs (LSPs) carry information about the
topology/prefixes existing in that OSPF (ISIS) network.

At a more granular level, the amount of information carried in
one OSPF LSA is different from the amount of information carried in an
ISIS LSP.


6  Link Types & DRs/Pseudo Nodes

Srihari

There are two types of links: broadcast and point-to-point (p2). With
p2p, both devices know of each other and send data to/from each
other. With a multi access LAN, there are 3 routers. To avoid a full
mesh where everyone talks to everyone else (a big mess), we appoint one
router as the leader. Every device only talks to him and he talks to
everyone. In OSPF, this leader device is called the Designated Router
(DR). In ISIS, it is called a pseudo-node. For ISIS, 00 indicates that
he is not a psuedo-node (example: node-id 0000.0000.0007.00). However,
01 says he is a psuedo-node (example: node-id 0000.0000.0007.01) for
one network. 

In the following example, 0004 is the psuedo-node for the 01 LAN (the first
LAN) that he is connected to. The network number (01, 02, ...) goes up
to 255. A device can be a psuedo-node for up to 255 LANs that he is
connected to:

procket7(config-if)# sh mpls te database pseudo-nodes brief
Traffic Engineering database for context "default"
TE-RID psuedo-node lsps [transit 0 terminated 0] #links 0
 * DR  57.1.1.5, area 0, ospf-p7, #adjacencies 2, 00:04:47 ago
 * NID 0000.0000.0004.01, level-1, isis-p7, #adjacencies 2, 00:04:40 ago
 * NID 0000.0000.0007.01, level-1, isis-p7, #adjacencies 2, 00:04:40 ago

A single router can be a psuedo-node/DR where he has multiple LAX
networks that he can be connected to. 


7 Packet Classifications 

(RP queue priority assignments in ucode)

--------------------------------------------------------------------
From Rajesh/Venu (tli/dino comments at end)


To summarize the packet priorities are..

This document lists the packet-types that are of interest when packets
destined to the RP are received by the NPU.

When the NPU receives a packet, it first determines if the packet is
to be forwarded or to be sent up to the RP.

If the NPU microcode determines that the packet is to be sent up to
the RP, it will queue the packet to a inbound queue.

There are 8 RP inbound queues. 0 thru 7. Queue # 0 is highest priority
while Queue #7 is lowest.

Queue numbers 0 & 7 is reserved for other purposes, leaving numbers 1
thru 6 to be used by the microcode.

The idea is to assign important packets a higher priority queue while
having less important packets assigned lower priority.

This is set of tables of protocol 'types', for various protocols
running on a Procket stack. The first column, refers to the inbound RP
priority associated with the protocol packets. If an RP destined
packet does not match any of the following packet-types, it gets
assigned the lowest priority (6).

Legends:
 '***' implies that one needs to look deeper into the packet.
 '?'   implies that the RP-priority for frames containing the corresponding
       protocol's packets are unknown.



Layer 2: Encapsulations
----------------------
                             Ethernet           VLAN               HDLC            PPP             GRE    RP-Prio Protocol-Type     
***     IP                   0x0800             0x0800             0x0800          0x0021          0x0800
4       ARP                  0x0806             0x0806             N/A             N/A             N/A
***     IS-IS                LLC(0xfefe)        LLC(0xfefe)        0xfefe          0x0023          0x00fe
***     IS-IS                0x8870             0x8870             N/A             N/A             N/A
***     VLAN                 0x8100             0x8100             N/A             N/A             N/A
1       PLP                  0x9200             0x9200             N/A             N/A             N/A
4       IPv6                 0x86dd             0x86dd             ??              0x0057          0x86dd
1       Loopback/keepalives  0x9000             0x9000             0x8035          0xc025          N/A
1       PPP_IPCP             N/A                N/A                N/A             0x8021          N/A
1       PPP_IPv6_CP          N/A                N/A                N/A             0x8057          N/A
1       PPP_LCP              N/A                N/A                N/A             0xc021          N/A


Layer 3: IPv4 Protocol numbers
------------------------------
   ('***' implies that one needs to look deeper into the packet)
RP-Prio Protocol         Protocol-Number
6       ICMP               1 (0x01)
4       IGMP               2 (0x02)
***     TCP                6 (0x06)
***     UDP               17 (0x11)
4       RSVP              46 (0x2e)
***     GRE               47 (0x2f)
***     OSPF              89 (0x59)
4       PIM              103 (0x67)
4       VRRP             112 (0x70)

Layer 4: TCP protocols
---------------------
RP-Prio Protocol        Port-Number
6       TCP-FTP          20 (0x0014)
6       TCP-FTP-DATA     21 (0x0015)
5       TCP-SSH          22 (0x0016)
5       TCP-TELNET       23 (0x0017)
6       TCP-NTP         123 (0x007b)
3       TCP-BGP         179 (0x00b3) (source port or dest port)
4       TCP-MSDP        639 (0x027f) (source port or dest port)
4       TCP-LDP         646 (0x0286) (source port or dest port)


Layer 4: UDP protocols
----------------------
RP-Prio Protocol        Port-Number
6       UDP-SNMP        161 (0x00a1)
4       UDP-PIM-AutoRP  496 (0x01f0)
6       UDP-NTP         123 (0x007b)
4       UDP-LDP         646 (0x0286)


OSPF packets
------------
RP-Prio Protocol
2       OSPF hello packets
3       All other OSPF packets (except OSPF hello packets).

ISIS packets
------------
RP-Prio Protocol
2       ISIS P2P hello packets
2       ISIS LAN hello packets
3       All other ISIS packets (except the above two types).


Rajesh,

I have a few questions...

What priority do transit packets with options get?  What about packets
that failed the route lookup?

Why do you have ICMP at priority 6?  I can't think of a single ICMP packet
that the router really cares about.  Other than echo replies or 
traceroute unreachables, it's almost always a DoS attack.

NTP can and should go at lower priority.  If we're under attack, I don't
think keeping the correct time is a high priority.

BGP should probably be priority 1, as should IS-IS.

Thanks,
Tony


The problem is that you can't differentiate EBGP from IBGP.  If
you have your IGP up and you lose IBGP, then you become a black hole.
If you drop EBGP, then you're ok.  So...  EBGP < IBGP == IGP would
be ideal.  But unimplementable.  ;-)

tli

dino

    Originally we (Tony and I) thought that if we left the highest priority
    queue to be used for internally generated events, we could talk to the
    chips when a DOS attack was underway. There would be no way any external
    traffic could go to queue 0, so we had a channel to communicate without
    compromise. So I do think we should keep it reserved.

Q#0 -- Reserved
Q#1 -- Link Keepalives (PLP, HDLC, PPP) (Highest Priority)
Q#2 -- ISIS, OSPF
Q#3 -- BGP
Q#4 -- RSVP, ARP, IGMP, PIM, VRRP, LDP, MSDP, NTP
Q#5 -- Telnet, SSH
Q#6 -- Default/Junk, SNMP, FTP, SCP
Q#7 -- Used by H/W for invalid packets   (Lowest Priority)



8 IPv6 Notes

Why IPv6? Need to move from a 32-bit address space (IPv4) to a
128-bit address space (IPv6). There wasn't enough hierarchy in a
32-bit address space. People were wasting class C networks. A class C
network is where the first two bytes are the Network ID and bottom two
bytes are for doing subnetting and host allocation. People who
couldn't fit into a class C were getting a class B, but they were not
using all the address space. Not all the class B was being allocated. 

On a Procket, most of the prefixes that we'll see in the routing table
will be /32 or /48. Most of the volume traffic in a core router is
destined for both prefix IDs. A Procket router has a pipeline that is
designed to /32 addresses.  

In the case of IPv4 multicast routing, the router has to do a source
IP address lookup and a destination IP address lookup. You always need
to recirculate and go through the pipe line twice. With IPv6, you need
to go through the 4 times because there are 4 32-bit quantities.

More IPv6 features:

  + Auto configuration for hosts, which is better than what we have
    today with IPv4 with DHCP. IPv6 has statement configuration where
    a host comes up, and based on its Ethernet address, it can prepend
    the prefix by listening to Routing Solicitation messages. So,
    your PC and come up and run even though your DNS server is
    down. This is a good feature for when you're in a local lab
    environment, and your network infrastructure is not in place. Your
    PC can come up and start talking on the network.  

  + A more simple security mechanism. It was hard to bootstrap true
    end-to-end security with IPv4 because there was a huge deployed
    base and it was hard to do. So, tunnel encapsulation had to be
    used instead with IPv4. With IPv6, all hosts are required to
    implement the AH and EFT header options. The IPv6 headers are all
    in clear text and all the sensitive data is encapsulated and
    encrypted. The routers in between don't have to do
    anything. Hopefully, router vendors will not need to do any
    security in the middle or edge of the network. 

  + Simple transition mechanisms

    IPv6 to IPv6 over an IPv4 Internet
    IPv4 to IPv6 over an IPv4 Internet
    IPv4 to IPv6 over IPv4/IPv6 (Microsoft's version)

    We can have two IPv6 hosts talk to each other over an IPv4 Internet. This
    can be done with the existing GRE tunneling mechanism. We also want
    an IPv4 host to talk to an IPv6 host somewhere on the network
    edge. The most comfortable transition mechanism is called a dual
    stack. That is where IPv6 stack is on a Window's XP machine
    (disabled by default). You can run your applications over IPv6 or
    IPv4. You specify if the destination host address is an IPv4 host or
    an IPv6 Nokia Phone, for example. Just load the appropriate
    stack. If you have a dual Internet,
    just specify IPv4 to IPv6 and life will be good. If you have IPv4
    or IPv6 only islands, then you must use these translation
    mechanisms. 


9 IPsec VPNs, CPE, RFC 2547


a)

tli

2547 does not scale. This is obvious to anyone who knows a little bit
about routing. The number of prefixes that a router needs to carry in
a 2547 network is huge. It increases linearly with the number of
customers. There's a large multiplier attached to it. Procket does not
want to support it. However, some Procket customers are insisting 2547
support or else they won't do business with Procket. Procket will not
be religious but broke. ;-) We will do something we don't like yet
provides something that 2547 does not do. :-) IPsec tunnels are the
correct long term solution. Putting unincrypted personal/sensitive
data on the Internet is the Wrong thing to do. IPsec tunnels all the
way. People should not want our service provider dealing with our
security piece. People should not want their SP managing their VPN for
them. Security will be compromised. Disclosing a password for a router
is the worse thing someone can do. In that case, the SP owns you. But
... SPs understand that they MUST SELL SERVICES. They do not want to
be in a bandwidth commodity situation. The SPs made out like bandits
when they sold services in the telephone network. How many people pay
every month for call forwarding and call waiting? How much does it
cost to support it? Almost nothing!! They wrote the software once and
installed it on all the 5ESS switches!! What's the margin on that?
SPs do not push the VPN solution onto customers and have the customer
manage it, even though this is what the customer really wants for his
security. 

So, we have the ATT guys who want the 2547. However, we have Verio who
does not want it. 

I agree, scalability of a single VPN isn't an issue as long as you
stay away from some mega-corps. Their needs can well be an issue.

The problem comes about with some SP based VPN services when
the number of VPNs is large and when state has to be maintained
in the SP network. Then you have the scale of the sum of all of the
VPNs being stored in one place, creating a scaling issue.

If you remove the state from the SP network and leave it in the
CPE, then the issue disappears.


Totti-san,

There is nothing that constrains the Internet to stop growing and from
people injecting potentially poorly aggregated routing information
thereby driving the Internet into the ground. Further, for those users
who are using RFC 2547, there is no way to cause that service to scale.

Note that while the constants differ from vendor to vendor, the facts
are quite simple: for the Internet to continue to scale, folks have to
aggregate their routes.  For folks to provide VPN solutions, they must
NOT use RFC 2547. It is very simply broken and this is exactly why.

Regards,
Tony

Reply from Totti-san:

|    >  For folks to provide VPN solutions, they must NOT use RFC 2547.
|    > It is very simply broken and this is exactly why.
|
|    Yes, I can understand what you are saying.
|    But many of my customers actually provide RFC2547 VPN service
|     and can't stop their service without an alternative solution.
|    Do you have any idea about the alternative solution for 
|    RFC2547 provider?
|    (If the procket box can provide such a solution, we can 
|    get much more
|    business chances! ;-) )


The correct solution is for folks to use Ipsec in CPE boxes.

Unfortunately, we don't sell those.  ;-)

2547 is easy for the end customers because it shifts all of the
management burden to the service provider who in turn shifts it onto the core
router.  Not good.  However, if the service provider is willing to
provide a managed CPE service, this management burden can be placed on the
automation of the service providers backroom servers.  Someone needs to
communicate this to service providers and show this as an example of a
business model.


b)

tli

  Re: manageability of L2 VPNs and the demarc for the CPE.

  It's entirely reasonable to ask that the L2 CPE switch is IP
  manageable and that the service provider at least be able to ping it
  for continuity checks.

  Re: IPsec VPNs

  I'll happily take the heretic view that IPsec VPN's are not only
  manageable, but preferable to L3 VPNs. First, as to manageability:
  an IPsec VPN requires that you configure keys between CPE
  devices. Given a reasonable, secure management subsystem, this
  can and should be automated. This requires nothing more
  complicated than SSH and some scripts. The configuration does
  scale as the number of VCs that you want to instantiate, but the
  associated state is ONLY in the CPE device. The topology is
  flexible, so if you prefer minimal configuration and prefer a hub and
  spoke topology, that is workable. It also has the great advantage
  that this is not locked into any single provider. 

c)

tli

  All that's required here is that the SP have one IP address within
  the customer's VPN. This is not unreasonable, considering it's a
  managed service.

  Also, it's not reasonable to assume that the CPE is not managed by
  the SP. There are likely to be cases where both are
  appropriate/desired.

  If a customer doesn't trust the SP to be connected to their network,
  then the customer is fooling themselves when they hand an
  unencrypted packet to the provider in the first place.


d)

From: "Tony Li" <Tony.Li@procket.com>
Sender: eng-beta-admin@procket.com
To: "Takefumi Murakami" <t-murakami@netone.co.jp>,
   "Dino Farinacci" <dino@procket.com>
Cc: "cs-netone" <cs-netone@procket.com>, <procket-tech@netone.co.jp>
Subject: RE: Question about NPU SRAM
Date: Fri, 31 Jan 2003 11:36:50 -0800


Takefumi-san,

If your customers are interesting in IP VPN's along the lines
of RFC 2547, the amount of forwarding table space that they
can use is effectively unlimited and no router is big enough.

We encourage our customer to closely examine the scalability
properties for RFC 2547 before deployment of that solution.

Tony


e)

dino

--dino per Verio, Andrew Partan, Sean Doran, Guy Almes from Internet2 all 
in Vienna-----

from dino:

- ISPs prefer 2547 to a managed CPE service for 2 reasons: 1) they don't want a
  CPE managed service because they don't want to deal with customer 
  requirements, 2) since 2547 requires all sites for a given customer to be
  offered by a single ISP, they can lock in the customer (this is the big win).

tli reply:

Also, please ask them if this is 1M routes across the box
or 1M routes in a single line card.  For RFC 2547 applications,
many customers are looking to support 1M routes across the box.


f)

dino

How will Procket deal with VPNs and convergence? MPLS solves three
main problems:

o) Precisely place traffic on the various paths of a network. It
   allows you to avoid unnecessary congestion and wasting resources in
   the network, such as bandwidth.

o) Customer want to be able to transport Layer 2 services across a
   Layer 3 backbone. That is, having an Ethernet over here sending frames
   to an Ethernet over there across the country (or framerelay to
   framerelay; or ATM to ATM)? But, they don't want to have a Layer 2
   infrastructure because that fundamentally won't scale. To solve this,
   customer put a tunnel between the two locations, such as an IP tunnel
   that is marketed as a MPLS tunnel. This is what Layer 2 VPNs is all
   about.  How can Procket be part of delivering these Layer 2 services
   without having to implement ATM or Frame Relay directly on our router?
   That is, without having to transport cells or SONET frames over this
   kind of media. 

o) From your house, being able to feel like your directly connected to
   Procket's network. My home network being part of Procket's internal
   network. That is, having access to all of Procket's dns names and
   services that are inside of Procket's network without having to do
   special application translation. The way to do this is to extend
   all the addressability out from Procket in a secure way. This is
   done by putting multiple routing tables on the backbone. Many
   telcos in Europe and Japan are trying to support tens of thousands
   of overlay networks on their existing major backbone, and they
   claim that's it's all secure. This remains to be seen... This can
   all be done with regular unicast routing; however, unicast routing
   will take the shortest path. Not necessarily the path with the most
   available bandwidth. 

When a customer asks Procket to support 2547, we tell them it does not
scale. Procket suggests customers use Layer 2 VPNs with the Martini or
Kompella drafts. Procket also does not want to be the TE router that
has terminate all these virtual routing tables. Procket wants to be at
the core doing fast yet raw MPLS. That is, to build your core with
Procket. 

g)

from dino to innet email regarding KT wanting 2547

    When I was in Korea, it wasn't clear at all KT needed 2547 for core boxes.
    And I had thought I convinced them of that.

    Here were my points:

    o Our boxes can stay in their core network for 5-7 years.

    o KT wanted to reduce their monthly rates to residential customers
      thereby reducing bandwidth to the home. That would make the core
      last even longer.

    So I don't understand why they need 2547 right now for core routers for
    the NGN network.

    Also, what is the status on the box we wanted to deploy for NCA at the
    KIX?

>>  Recently, KT Launch VPLS service with Juniper M series
>>  and They still testing GSR12816=20
   
    So that means they can put Juniper boxes at the edge, and use Procket in
    the core moving MPLS packets at line rate. Do you agree?


10  Future Network Architectures, Pains, and Trends

This summary is the bulk of the feedback that tli and dino have heard
from customers over the past 10 years.

10.1 Future Architectures

Assumptions

  Continued 100%/yr growth of the Internet (back to pre bubble
  days. But it's very hard to gauge this number. Many customers are
  changing ISPs. As customers change, one ISP's growth rate goes
  down while another goes up.)

  Slow convergence of other services. ATM failed, and the big
  bandwidth user changed everything.

  An unlit fiber glut. Many green fields companies dug the trenches and
  laid the fiber, but they very wisely did not purchase the electronics that go
  on both ends of the fiber. DWDM gear, routers, muxes, telco
  gear. Alot of money goes into lighting up the fiber. 

  CapEx shortage. Equipment cost.

  OpEx shortage. What it actually takes to run and operate the
  network. The CapEx and OpEx are generally about equal in
  cost. Companies spend about as much money in labor for their
  operations and engineering staff as they do for their equipment
  costs. Procket will try to shrink the OpEx part, which is a huge
  win. Making our boxes easier to use and manage. 

  Carrier OpEx costs are dominated by labor costs.  The more we can do
  to help the Carrier automate system management, the better.

Drivers

  Decrease CapEx and OpEx

  Continue to grow

  Fold in legacy services to maintain higher margin. Anything we can
  do to bring the IP and ATM networks together is a good thing. But it
  will not happen over ATM. Running two networks is more than twice as
  hard as running one. 

Packets an Chips

For its internal cell switching, a Procket router does not use ATM
53-byte cells. Procket's cell size is 30 Bytes of payload plus
overhead. This size efficiently uses Dynamic Random-Access Memory
(DRAM) bandwidth and avoids IP fragmentation overhead. Unlike a
Procket router, when cells are much larger than the packets getting
presented, DRAM bandwidth is wasted.

A fully loaded Atlas router contains 2 RP cards, 3 Switch Cards, 12
Line Cards, and 48 MAs. Each RP card contains a PowerPC CPU and a CPI
chip. Each Switch Card has 1 Striper and 12 Memory Controller Unit
(MCU) chips. Each Line Card supports 1 LCU, 1 NPU, and a maximum of 4
Media Adapter (MA) cards. Each MA card contains 1 Glue Adaptor (GA)
chip. The communication to various chips is done through High Speed
Serial Links (HSSL). From a software perspective, each chip is
identified by a combination of board ID and chip ID. 

In a full system, each Striper communicates with 8 of 12 NPUs. Each
Striper communicates with a different set of 8, and at most 4
overlapping NPUs with any other Striper. Therefore, at least 2
Stripers are needed to cover all 12 NPUs. Instead of one Striper to
communicate with 8 NPUs and the other to communicate with the
remaining 4 NPUs, the Stripers does load balancing, where each Striper
communicates with 6 NPUs each. There can be a third Striper in the
system as a standby Striper, and it would be switched into service if
either of the other two Stripers failed. Each Striper listens to at
most 6 specific NPUs for any given configuration. This redundancy
scheme is described as 2+1 Switch Card redundancy.


10.2 Decreasing CapEx and OpEx While Growing

Buy more efficient gear

  Metrics
  CapEx
  Power

  Cooling is a major expense in running a POP. It is almost 1/2 the
  cost of running the POP HVAC. Figuring out a way to take the heat
  generated by the equipment out of the building, which takes even
  more power. 

  Rack space. A central office has a finite size. 

Make it easier to manage

  Fewer boxes to manage. Think about it. In my personal life, do I want to manage one
  account to pay off each one of my bills? Or do I have one checking
  account? One thing to manage, even if it has more things in it, is
  easier than more things to manage. Procket will help customers
  decrease the number of systems they need to manage. 

  Increase flexibility

  Decrease release management overhead. Customers spends 30-40% of
  their network engineering time just trying to figure out
  which sw release to run. "Oh, this image does not work in this part
  of the network because of this bug. But it'll work over here because
  we don't use that." Procket will give customers sw images that they
  don't have to think about. 

  Improve reliability for sw and hw

10.3 Growth

Moore's Law definition:

The observation that the logic density of silicon integrated circuits
has closely followed the curve (bits per square inch) = 2^(t - 1962)
where t is time in years; that is, the amount of information storable
on a given amount of silicon has roughly doubled every year since the
technology was invented. This relation, first uttered in 1964 by
semiconductor engineer Gordon Moore (who co-founded Intel four years
later) held until the late 1970s, at which point the doubling period
slowed to 18 months. The doubling period remained at that value
through time of writing (late 1999). Moore's Law is apparently
self-fulfilling. The implication is that somebody, somewhere is going
to be able to build a better chip than you if you rest on your
laurels, so you'd better start pushing hard on the problem. 

tli:

The growth rate is working against us. 100% growth is higher than
moore's law. We can't keep up with the growth rate simply by turning
up the hardware. Serial link technology doubles about once every 2
years. Silicon is once per 2 months. 

   100%/yr >> Moore's law >> Backplane technology

Backplane technology is growing a much slower rate than Moore's
law. Moore's law is growing much slower than 100% per year. In
summary, routing technology can't keep up. 

   100%/yr >> D Bandwidth/Power 

If you look at the amount of Bandwidth that we get per watt, that is
not improving faster than 100%. Boxes keep getting hotter.

   100%/yr >> D Bandwidth/Volume

   Technology improvements work against CapEx. They raise system
   prices. Decreasing OpEx implies increased system complexity, which
   hurts system reliability. There are many trade offs.

We are reaching a point were we can't cram more and more stuff into
tighter boxes. It won't scale. Physics will not allow it. To decrease
OpEx, we will make the system more intelligent so it takes less effort
to manage it. 

10.4 Resolutions

Continued system growth

Limitations on physical features drive hardware clusters

Software clusters decrease OpEx by reducing boxes. Interconnect a
handful of Atlases, interconnect them with existing MAs, and write
some software so the entire thing behaves as one router. To the
operations folks who are 3,000 miles away from the system, it should
feel like a single router. This clustering will decrease OpEx.

Bleeding edge technology, just one or two generations behind
microprocessors because we want something that is reliable and
stable. Be a little behind the curve. 

Merged services over IP and MPLS. IP alone will not do it. ISPs will
run voice and VPNs over the network. 

Clusters decrease need for POP interconnect and optical
switching. That is, many many Atlas racks of equipment functioning as
one router. Non revenue interfaces interconnect the different boxes. The
hardware cluster fabric itself becomes the primary entire bandwidth
for the POP. After we eliminate the optical switch, we can allow any
DWDM port to connect with any router port. We'll have true any-to-any
bandwidth after we cluster the routers together. All the router ports
will be equivalent. There is no point to connecting an optical switch
to a cluster. No need to shift fiber from router to router, because
it's all "one router."

Procket is designing to 1 petabit of bandwidth and
this will require 2084 Pro/8812's (or equivalents).


10.5 Our Direction

Seymour cluster based on Atlas/Gordon/Electra
Preserve CapEx in Chassis, LC, MA, & RP
Software clustering (all routers managed as one system)
Hardware clustering w/ fiber interconnect
Upgrade via switch card swap
Increasing interface speeds and diversity. OC-768
Increasing density while clustering. New processing technology.
Improved backhaul and edge density
 
The interconnect cost between the edge box and the core box is killing
customers. Customers need to integrate their edge boxes into the
core. If we take this to its logical conclusion, we end up with only 1
box in the POP. The "box" is redundant, reliable, core interfaces,
edge interfaces, and its extensible (it grows as the provider
grows). Imagine one box providing all the bandwidth needs for the
entire Bay Area. It's all about delivering bits. Delivering more
bandwidth more efficiently. 


10.6 Industry Issues:  Defining the problem 

Has the new router hardware introduction rate kept up with traffic
increase rate?
Are routers scaling fast enough?  
Are routers getting simpler at the core? From a functionality
standpoint, are they doing less? Do you want this to change?
Despite management complexity, are VPNs generating revenue?
Does Traffic Engineering address your needs? Is it easy to manage?

Answer: No. Most ISPs are hurting on OC-192 port count. Today they can't look
at packets at line rate. They need to count packets, and it's been a
longgggg wait. Need a way to count packets on a per prefix and per AS
basis. Want this ability in hardware. Been requesting this for a long
time. Need cluster solutions that are easy to manage. 4 to 10 routers
per POP. Vendors need to stop hyping 99999.

Is BGP scaling? What areas cause a big problem?
Answer: BGP has been forced to do so much. Nothing should
change. However, the iBGP mesh explodes as the number of routers
increase in the POP. Customers need a much simpler way of
consolidating. 


Should we have simpler routers in the core?
Answer: Not at all

Are VPNs generating any revenue?
Answer: No. But a CPE based IPsec VPN is the future. And that, will
generate revenue.

Is TE needed in the core?
Answer: No. However, none of the customers came from a Telco background.

How is IGP stability? What new features do you want in IGPs?
Answer: No new features are needed. 

Do you think IPv6 is solving any of these problems? If not, is this
where we should go to solve the problem?

Is edge bandwidth growing at a faster rate than at the core?
Answer: The core is growing 3-4Xs faster than the edge. 

Are today's routers easier to manage?
Answer: No. The biggest problem that ISPs have with vendors is getting
stable features sooner.

Is software still the primary reason for router failure?
Answer: No. 40% of the new boards are Dead On Arrival (DOA). 

Do you believe in redundant RP solutions? How much effort should be
spent?

Do you need QoS, and if so, what kind is it?
Answer: There was total silence in the room. 

What trend shifts do you see in the ISP business?
Answer: Most of the consolidation is done in the service provider
business. However, there will be more bad news before it's done. 

Is North America influenced by international network designs?
Answer: Most international designs are copy cats of North America
design. 

Has public vs private peering changed over the last 3 years?

Are L2 switches still integral to your backbone design? What about
ATM and optical switches?
Answer: yes. 

Does router clustering address your concerns with managing too much
equipment? Or, is L1 and L2 integration sufficient?


11 Wireless

The future of networking will be driven by the need for more
bandwidth at ever decreasing costs. The resulting technology will
still be called Ethernet.

Innovators will find a practical wireless last-mile solution. This will
spell the death knell for the RBOC's.

We don't have broadband wireless covering 80% of the population
yet. If and when wireless becomes the de facto distribution for last
mile broadband, then VoIP over wireless will be part of the standard
flat rate Internet access fee. The incremental cost of the VoIP call
will be zero.

"Free service" and it is true. There are no incremental costs above
and beyond an existing broadband connection and flat rate Internet
access fee.


12 Netheads vs Bellheads

There's a limit to what packet
switching can and should be used for. Use the right tool for the job
at hand, taking cost, reliability, speed, etc. into account. Do I
really want my bank running transactions over the Internet? Not
without some crypto than is far stronger than what I know of. Do I
want my 911 call routed over the Internet? No thank you, the
technology is too immature and frankly, that's one thing that I'm just
not willing to gamble with yet. Give it another 100 years or so.

Just because you CAN do something doesn't make it the best way to do
something. As someone very wise once taught me: "Don't fall in love
with the technology. There's always something better around the bend."
Turning things into a religious debate is NOT the sign of a good
engineer. A good engineer should be trying to look at things as
objectively as possible, understand that all technologies have
limitations, and optimize to meet requirements. That's it.

13  Packet Network vs Circuit Network

You ask why we should consider merging technologies. The
economic answers are clear: running two networks is more
expensive than one. The carriers must cut costs somehow. Even if
the result is that most new deployments go to the packet network
while legacy and life-critical deployments stay on the circuit
network, the carriers will be able to avoid extremely costly capacity
upgrades to the circuit side.

Thus, the future will be a mixture: the circuit side will continue to
support some services and it will not get decomissioned in anything
like our lifetime. Most new services will be deployed on the packet
network. And all of this feuding is pretty much for naught, because
the economics of the situation are pretty compelling.

14  VoIP vs POTs vs Cell Phone

The case for VoIP is quite clear and it arrives in the mail monthly. If I
can make phone calls and not pay POTS rates for them, then that
should make my bill cheaper. As a consumer, I can make the choice
of the technology that I want to use to make my call. Yes, VoIP is
not identical to analog, but for the vast majority of situations, it's
perfectly adequate. This is acceptable to the vast majority of
consumers. Consider cell phones. The quality of the call and the
reliability are nowhere near matching the average land line.
However, consumers are willing to pay more for the feature of
mobility. The consumer can and quite reasonably will enjoy some
economic benefit from VoIP. And that's what makes this technology
compelling. Even at $.05 a minute, long distance costs too much.

I'll also point out that I've visited several large organizations where
they've deployed VoIP for their own internal usage. They find that it
simplifies the wiring problem and has proven reasonably reliable.
While it has less of an impact on their long distance bills (because
the folks that they are calling are still on POTS), even the cost
improvements due to savings on internal phone calls and location
flexibility have paid off handsomely. Once the technology matures a
bit, watch out.

Again, let me point you to the folks who already have Internet access
and can download a softphone for VoIP. Fact: you can get into VoIP these days for not
much more than the cost of a headset. Yes, startup costs will deter
some. But for the early adopters, this is not that much of an issue.
Folks are already installing broadband just for Internet access. VoIP
is just a bit more possible value added to the mix. I should also
point out that a) micro optimization is EXACTLY what this is all about
-- you're going to think about how you make your phone call exactly
because someone is pinching pennies


Then someone else on lightreading said:
Since this is a predictive statement, I can not argue against this. But
I would like to know why. Is it because, those services can not be
supported in the TDM environment? If so, can you give an example
of such services?
----------

Simply because it is cheaper. Look at the cost per bit of TDM gear
vs. packet gear.

Tony

Look, whatever you want to call it, I want to be able to make a
phone call for less. For the same call, the VoIP call is cheaper than
the PSTN call. Yes, ok, I sacrifice QoS, but then again, I'm happy to
sacrifice it if my call isn't life-threatening.

Hmmm... And if I'm willing to live without "reliability and QoS" I can
use my cell (for more money, but with mobility) or I can use VoIP for
free. Well, I know what I'm going to choose. ;-)

Actually, what will be really interesting is when we have a wireless
last mile deployed and can have mobile VoIP. That should be truly fun.

Well, all that I'm arguing is that with VoIP, I can also make the
trade-off. I haven't been watching the cell world closely, but have
folks actually been able to raise their prices because of quality
improvements? As far as I can tell prices are stable or falling.


15  Enterprise Market

mass market = residential access

Sorry, no. The mass market for networking gear is the Enterprise. The
internal bandwidth of an office building frequently is several orders
of magnitude more than its external bandwidth. Similarly, the number
of Ethernet ports sold into Enterprises far exceeds the sum total of
all ports bought by carriers for core, access and aggregation
combined. 

As with all things silicon, costs are driven by volume. The Enterprise
chose Ethernet (no matter what the real technology is, we'll call it
Ethernet ;-), and that drives the volume and that drives CoGS and in
turn end user prices. 

As soon as you do something outside the volume envelope, your costs go
way up. That little phrase "carrier grade" is a 10x price multiplier.

Tony


16  SW Release Maintenance Issues

tli

There's no such thing as not affecting a release.  Everytime
a software engineer fixes a bug, there's a 20% chance that
he's introducing another bug that's just as bad.  [I'd argue
that the real number is more like 50% -- whatever.]

This is simply a fact of life.  Until such time as computers
can program themselves, we have to have humans work on them.  And
humans make mistakes.  Without the ability to somehow magically
*KNOW* that we are not introducing a regression, we will break things.
And that pisses off customers far more than anything else.

Well, what we're doing is exactly the opposite: you have to
justify why a fix should go into a shipping release.  As you
point out, it's a cosmetic bug and we didn't find that level
of justification.  If folks want to avoid the hop scotch, then
they need to stay with a single, stable release.  That means
that they will have to work around cosmetic issues.  If they're
not willing to do that, then we have an issue.  We can't
provide stability and all patches at the same time.  IOS tried
and you see the result.


17 Multicast Test Scenarios, Demo Setup, and Troubleshooting Tips

a) Multicast Test Scenarios

dino

    First demo: "We-are-not-vaporware" demo
    ---------------------------------------

    1) Shows multicast on Electra.
    2) Send 1 stream of 2gbps, replicating to 30 oifs.
    3) Preferably the source and receivers are not directly connected to this
       box so we can show a typical core (non-edge) router.
    4) Show this with ASM and SSM groups.
    5) If the audience is not impressed, do a "restart pim" during this and
       have them watch the data still flowing.

    Commentary:

    o I doubt very much cisco cannot do this rate. Not on any platform. 
    o Most configurations I've seen lately don't have an oif of 30. We can
      show this is a low-end demo from our perspective.
    o Illustrates hitless restart. Also shows how PIM doesn't need an explicit
      design for graceful protocol restart because we can bring up the PIM
      process before an oif or route timeout.

-------------------------------------------------------------------------------

    Second demo: "Distributed line-card replication" demo
    -----------------------------------------------------

    1) Shows multicast on a distributed NPU system.
    2) Send 6 streams at 1gbps from 6 different line-cards.
    3) Have fanout on 4 different line-cards.
    4) Use fanout like this, 10 GigEs on 1 MA on 1 line-card, 1 10 GigE on 
       another line-card, 4 OC48s on 1 MA on a 3rd line-card, 1 OC192 on a 4th
       line-card, and then all of the above on the same line-card. That would
       be 32 oifs total.
  
    Commentary:

    o Impressive to show variety of interfaces across entire platform.
    o You can demo two-stage replication.
    o Box is yawning for more work to do.
    o This was the original design goal. We did not change direction, at all.

-------------------------------------------------------------------------------

    Third demo: "Come-and-go latency" demo
    --------------------------------------

    1) Shows join and leave latency on Atlas.
    2) Start a 5gbps stream.
    3) Have no one joined to the group the source is sending to. Watch the
       router drop packets without using box bandwidth (input line-card
       should drop packet).
    4) Receive a PIM join on an OC-192. Watch the counters increment while
       the forwarding stream is sent to the new oif.
    5) Have a bunch of PIM joins come in, at the same time, on ports on 4 
       different line-cards. Watch how the oifs go from 1 to 5 with one 
       announcement to FTM (and hence to the NPU). The joins should come in 
       within a 400 ms time frame.
    6) Receive a PIM prune on the first OC-192, see how long it takes for the
       data to stop going to the MA (you can watch the LEDs on the OC-192
       port).

    Commentary:

    o Impressive to show the dynamic nature of IP multicast at work on a high
      performance router.
    o How aggregating oif state can reduce control overhead in our system.
    o How leave latency reduces bandwidth demand quickly.
    o Illustrate how locality of line-card is used to not disturb the rest
      of the system when there are no oifs.

-------------------------------------------------------------------------------

   Fourth demo: "Petal-to-the-Metal" demo
   --------------------------------------

   1) Shows cross traffic from different flows from different line-cards to
      different sized oifs on different line-cards.
   2) Start 6 streams ranging from 1gbps to 6gbps. Make the streams come in
      on 6 different line-cards. Have them be 6 different interface types.
      That is GigE, 10GigE, OC-48, OC-192, GigE-vlan, 10GigE-vlan.
   3) Use a mix of oifs. Include vlans.

   Commentary:

   o Looks like a full IMIX of traffic at high-speed. 
   o This demo shows Atlas can be placed in a new build-out network that 
     provides unprecedented breakthrough multicast performance. 
   o No existing competitor can do this today. Tell the customer we are 
     entering very new ground. Procket is completely in a different league.

-------------------------------------------------------------------------------

   Fifth demo: "Pseudo-OC768 friggin cool" demo
   --------------------------------------------

   1) Setup 4 OC192s into a superinterface. Call it pseudo-OC768.
   2) Start a 35gbps stream coming in on the pseudo-OC768 superinterface.
   3) Replicate out two other superinterfaces configured the same way.
  
   Commentary:

   o Shows that we have 12 physical interfaces that will look in the future
     like 3 OC-768 interfaces. Show we can replicate at 35gbps.
   o Add more superinterfaces at will, while you are getting jazzed about 
     this demo. How far can you push it?


b) Demo Setup

From: John Zwiebel <jzwiebel@procket.com>
Sender: software-admin@procket.com
To: sw@procket.com
Subject: help debug the multicast demo
Date: Fri, 14 Nov 2003 14:17:08 -0800
Status: O
X-Status: 
X-Keywords:                  
X-UID: 53


for those of you with nothing to do (Bill), 
Please check out the following instructions.

if you have Linux, you can download a VLC binary from 
   www.videolan.org  and then come in and check it out.

--------------------------------------------------------------------------------

Downloading and starting VLC:

You must support IPv6 on your computer.
See below for starting IPv6 on windows XP and Macintosh

  1) Connect to one of the open cables in the csim lab
     (or go to www.videolan.org)
  2) ftp 2001:1:3::f ntt password ntt
  3) "get vlc-0.6.2-win32.exe"
  4) quit
  5) Double click on the installation file
  6) cd to where vlc was installed
     -- c:\Program Files\VideoLAN\VLC
     -- /Applications/VLC.app/Contents/MacOS/
  7) Type in the following command line
     -- .\vlc --ipv6 udp://@[ff3e:0:1::253]  (Windows)
     -- ./VLC --ipv6 udp://@\[ff3e:0:1::253\]  (Mac)



Starting IPv6 on Windows XP:
----------------------------
  1) Open a command window [start:run:cmd]
  2) Type "ipv6 install"
  3) check that you have an ipv6 address: Type "ipconfig"
     if an IPv6 address does not appear go to "Windows XP requirements for IPv6"


Windows XP requirements for IPv6:
---------------------------------
  There are several updates required for proper operation of IPv6 on
  a Windows XP system.  If "ipconfig" does not print out an IPv6 address
  you may have IPv6 installed, but it will be an older and obsolete version.
  Using IE and a connection to the internet, go to the tools menu and
  select "upgrade windows".  You should install all the "critical" upgrades.
  You will have to then install an "optional" upgrade for Advanced 
  Networking.  Unfortunately this upgrade will also install an IPv6
  firewall which will disable IPv6 multicast.

Disabling the IPv6 Firewall for Windows XP
------------------------------------------
  --Open the control pannel
  --Select "add or remove programs"
  --Select "add or remove windows components"
  --Select "networking services"
  --IMPORTANT: click on the "DETAILS" button
  --remove the checkmark next to "IPv6" firewall
  --click OK
  --click the "Next" button
  --quit

c) Troubleshooting Tips

Following are notes from JohnZ on how to view the mcast stream from
nanog 30 in miami. As you can see, there are some requirements and
clayton is not happy. ;-)

Note: also see http://www.i2-multicast.northwestern.edu/

From: John Zwiebel <jzwiebel@procket.com>
To: Greg McMillan <gmcmillan@procket.com>, Clayton Wagar <cwagar@procket.com>
Cc: John Zwiebel <jzwiebel@procket.com>
Subject: Re: [mgurus] NANOG Mcast feed help
Date: Mon, 9 Feb 2004 15:43:08 -0800


On Feb 9, 2004, at 3:24 PM, Greg McMillan wrote:

>
> For my own education (not to be printed), I'm wondering what the real
> problem was with the "setup". I'm just trying to follow your
> troubleshooting methodology.
>

Well, it looks like neither one of us knows what's going on.  :-)
I can look on the network using tcpdump to see packets arriving
on my mac.  I can also look on the core router (the PIM RP) to
see that it has MSDP state but maybe doesn't have (*,G) or (S,g)
state.

Given that I was able to track down the router that was the culprit
by looking at all the routers in between to see which one wasn't
doing the right thing.  I was able to get PIM to start sending joins
and so now I have packets arriving on my mac, but VLC doesn't know
what to do with them.

Unfortunately neither does REALplayer.

So, now the problem is back into clayton's court.

Clayton, I can get REAL to understand your sdp file but it seems to
object to these lines:
   a=rtpmap:96 mpeg4-generic/22050/1
   a=rtpmap:97 MP4V-ES

You said you changed it to H.261, but the sdp file hasn't changes.

So I've to leave now.
I've shown that claytons mcast is getting to procket and
that its now a question of getting the right applications on
both ends to deal with things properly.

I don't know what he's using to source his packets and as yet
there is barely any consistency between apps so it could be
anything.

"vic" and "vat" should work if you have a Linux or FreeBSD box
and want to try.  Unfortunately the FreeBSD system I have was just
upgraded to 5.2 and neither of those apps work here.  <sigh>

Clayton claimed in email he was using h262 so vic should be
good enough if you select the right (S,G).  The G is the
same for both, but the port numbers are 5432 for vat and 5434 for
vic

m=audio 5432 RTP/AVP 96
c=IN IP4 233.0.236.100/128/1

m=video 5434 RTP/AVP 97
c=IN IP4 233.0.236.100/128/1

So I've to leave now.
I've shown that claytons mcast is getting to procket and
that its now a question of getting the right applications on
both ends to deal with things properly.

I don't know what he's using to source his packets and as yet
there is barely any consistency between apps so it could be
anything.

"vic" and "vat" should work if you have a Linux or FreeBSD box
and want to try.  Unfortunately the FreeBSD system I have was just
upgraded to 5.2 and neither of those apps work here.  <sigh>

Clayton claimed in email he was using h262 so vic should be
good enough if you select the right (S,G).  The G is the
same for both, but the port numbers are 5432 for vat and 5434 for
vic

m=audio 5432 RTP/AVP 96
c=IN IP4 233.0.236.100/128/1

m=video 5434 RTP/AVP 97
c=IN IP4 233.0.236.100/128/1



18  BGP History 

tli

Time for a reality check. As the aforementioned cisco employee
who was 'pushing' BGP, you should know that there wasn't anyone
in marketing who cared in the least about BGP. I was working on it
because I knew of the shortcomings of EGP and wanted to help
grow the Internet. Plain and simple. All of the features (a.k.a., hacks)
that went into it were the result of customer requests. Those
features were subsequently documented as part of the normal
documentation process.

Changes that actually changed the _protocol_ (as opposed to the
implementation) were reflected in the spec, to the best of our
abilities. 

I realize that this doesn't fit in well with everyone's paranoid
conspiracy theories about Cisco market domination. But it is the
plain and simple truth.


from Hyperunner:

By allowing Cisco's implementation (of whatever protocol) to be
adopted as the standard, the IETF fell down on its job. The
competition were just as delinquent in their duty, because they let
Cisco and the IETF get away with it.
---------------------------------------------------------

Hyperunner,

Yes, the competition was not keeping up. However, your language
implies that there was something underhanded or improper about
what was going on. Frankly, the competition simply under-invested
in the Arpanet because they did not see the eventual commercial
implications. And to continue being frank, I didn't and Cisco didn't
either.

BGP was simply a solution to an interesting and challenging routing
problem. Yes, it would turn out to be necessary for the Internet, but
without the emergence of the Web, it was simply glue for holding
our 'geek network' together.

Tony


19  ASIC vs COT

tli

An Application Specific Integrated Circuit (ASIC) is normally
characterized by the silicon development process. In an ASIC process
flow, the design company specifies the RTL and works out the timing of
the entire chip. The ASIC vendor is normally responsible for
floorplanning, libraries, routing, and placement. This latter part is
also known as the 'backend'.

An ASIC can have fixed functionality, be configurable, or be fully
programmable. The amount of programmability is almost orthogonal
to the silicon process.

Why 'almost'? Because an ASIC process imposes certain
limitations. The ASIC vendor is typically motivated to process as
many chips as possible through their backend process as quickly
as possible. It can be very difficult to motivate them to expend extra
effort on the backend to truly optimize the design. This optimization
typically requires many iterations between the front end and
backend teams, which would drive up the overhead of the ASIC
vendor.

As a result, the ASIC vendor typically imposes a large set of very
conservative design rules. These rules simplify the backend
process, but also have the effect of limiting the performance and
scalability of the chip. This unfortunately means that it is
challenging to build fully programmable, high performance ASICs.

The alternatives are to use FPGAs (slow, low density) or to go
down a full custom VLSI path. In a custom process, also known as
Customer Owned Tooling (COT), the design team is also
responsible for the backend and hands off a completed design to
the fab house. This allows for a much higher degree of optimization,
both in speed and in the amount of functionality that can be put on
the chip, so this allows you to build fully programmable, high
performance parts.

Now, what you do with this process is another matter entirely. One
can build a full custom chip that was not programmable. One can
also build an ASIC that is a fully programmable CPU. The key point
is that the development process affects the functionality that can
be implemented, but does not dictate it.

So just what is an NPU? I don't know of a formal definition
anywhere, but if we draw on the analogy of a CPU, one might
define an NPU as a programmable processing unit that is
specifically designed for networking applications. One can build
NPUs as ASICs or via COT. That does not change their role as an
NPU, it just affects performance.


20  Multicast Initiative and Applications

dino

Everyone has IP and MPLS, so it is table steaks. So yes, there is
differentiation with IP multicast. Also, please note to folks who
think IP multicast is too much of a stretch to understand, but IP
multicast *is* IP. And you could say that people who don't have IP
multicast don't have a scalable IP  implementation. You can even refer
to the IPv6 standardization where IPv6 multicast is mandated day-1 in
any IPv6 implementation.

>> 1.  Does this multicast niche exist today and where (i.e. financials
>> with Tibco?)

    I believe the niches exist in these sorts of applications:

    o Financial (yes, Tibco as well as quoting services).

    o 1-to-many event distribution (VOD, audio-only (radio), live events).

    o "1-or-few"-to-many for distance learning (using floor control with
      random sources asking questions).

    o Desktop conferencing (more popular in the enterprise. Apps like SGI's
      ShowMe, Intel's ProShare, vat/vic/wb, etc...).

    o Internet gaming. Korea is taking the serious lead on this.

    o Any kind of server caching. That is file system sharing, web caches, etc

    o Large file distributions, like movie house Thu-evening film distribution,
      sending router images to 100 backbone routers, etc...

    o Third-party game watching. Where 2 people are playing Chess and 100
      people are watching them. This is typically few-to-many, in this
      case 2-to-100.

    o Tele-medicine. Remote surgery observation and collaboration. Uncompressed
      HDTV at 2 gbps a flow!

>> 2.  Is there an emerging multicast niche that we can dominate (i.e IP VoD?)

    I would like to say any application greater than 1gbps per flow. That 
    eliminates any vendor on earth except for us. So the telemedicine app
    would be cool. Go ask Steve Shultz and Hugh LaMaster at NASA-Ames for a
    status. I worked with them in '98 on a demo. It was years ahead of it's
    time (and cisco has done nothing with it in 5 years -- sigh).

>> 3.  What/who do we need besides the best core router to win in this
>> market (i.e. customization, partners?)

    Software companies like Microsoft, Sun, Tibco and Digital Fountain, 
    content providers like Yahoo, CNN, especially any startups in this area, 
    even trying to find events to give us PR. So Marshall at Multicast Tech 
    would be a good low-cost technology demo way to go. He has been wanting 
    to do something cool for a couple of years now.

>> 4.  Do these niches require massively scaleable core routers (i.e.
>> capacity, price?)

    Some do and some don't. But we have to approach them with an attitude like
    "what if you could do that at gigabit speeds"? Where they don't need
    performance, we can sell on quality and specific features.

    Like the feature I want to call "IGMP-Translation". So we keep telling
    people to deploy a SSM core, but XP runs only IGMPv2, well we'll accept
    configured sources on the edge and do PIM-SSM in the core. Something like
    this takes two weeks to implement and gives us big bang for the buck.

    Credit goes to JohnZ for bringing this up yesterday in front of Wiltel who
    would consider doing this. We convinced him from doing Multicast over PWE
    to doing SSM in his core.

>> 5.  Are these niches large enough to sustain a focused sales motion
>> (i.e. $$$)

    Go to the government. They will waste or sorts of money on cool high-speed
    technology. Internet2 also.

>> Thanks for taking time to share your thoughts and experience so that we
>> can capitalize on this important opportunity,

    I think guys like Srihari@Stealth will want to do cool things. So looking
    for similar startups that want to take a bit of risk to do cool things
    for revenue opportunities would be what I suggest for starters.


21  Growth of the Internet

tli

http://www.dtc.umn.edu/~odlyzko/doc/itcom.internet.growth.pdf

According to the best available numbers, the Internet is continuing to
grow exponentially at 100%/year. If the market needs a terabit machine
today, then it will need 2 terabits next year, four the year after
that, then 8, then 16, 32, 64, etc.

The control plane workload continues to grow rapidly because
some folks continue to find more ways to spend control plane
cycles. If folks would commit to not adding new features, we could
probably stop. Or at least not grow faster than Moore's law. Since
that's not going to happen, the control plane will always need more
cycles.

22  Forklift Upgrades

The history of this market is somewhat interesting and relevant. At
any point in time, the industry is capable of producing a router at
the (reasonable) limits of technology. That improves over time.
However, when the next generation of technology is released, the
customer is typically presented with a forklift upgrade, where older
systems must either be scrapped or reassigned to other tasks where
they are not operating at their optimal design points.

Thus, the goal that many of us aspire to is to create a system that
scales in a 'nice' fashion so that forklift upgrades are avoided. Thus,
yes, we are discussing architectures that are not necessary
immediately. Perhaps, depending on how large we scale, not for
years or even decades. Consider it a long term investment in
technology.

   HFR = 64 OC-192s in a 7 ft rack
   T640 = 32 OC-192s/chassis x 2 per rack = 64/rack
   8812 = 48 OC-192s/chassis x 2 per rack = 96/rack

Juniper routers fit in a 19" rack though, so does Avici and Procket.

Buy a platform that has room for expansion and a lifetime in their
network that exceeds the depreciation cycle of the gear.

If you're trying to perform an apples to apples comparison that
matters, then let's think about what can be fit into 3 full racks. I
suspect that HFR will get two chassis of interfaces and a full rack of
interconnect, giving it 128 OC-192s.

Juniper would get 5 T640's plus the TX, for 160.

Procket would get 5 8812 plus , for 240.

Bottom line: what starts out as a small density advantage will pay
handsomely when you look at interesting multipliers. Yes, at the small
scale, all architectures will have a nasty discontinuity right at the
point where they hit the next quantum of bandwidth, but in the long
run, this is less of a factor than overall density.
  
Number of Electra interfaces per MA:

     10 GigE per MA

     1 10GigE per MA

     4 OC-48 per MA

     1 OC-192 per MA

The total throughput per Line Card is 40G. 


23   Multicast vs MPLS

Multicast over mpls will most likely not work. With MPLS, there is no
way to do an RPF lookup for multicast. 

Interdomain multicast is important. Therefore, LDP and MPLS is totally
useless. John tried it at Cisco. Only unicast works over an MPLS
network. 

MPLS is just an extra complication. Most customers will eventually realize they
need to use multicast. Once they do implement multicast, they will
realize their MPLS solution will not work with multicast. If Procket
does not have a multicast over MPLS solution, customer will get rid of
all their MPLS. 

As we move toward IPv6, it is supposed to have more of a hierarchical
form and we will not need to distribute as many routes into the
core. So .. MPLS will go out the window. 

For the last 5 years we've said MPLS will solve this problem. But is
it working yet? Sometimes it is ... but so is multicast. So we now
have two parallel developments going on and they will crash into each
other eventually. John knows that mulicast is going to win. 

There are two possible solutions:

  o Create an MPLS solution for multicast
  o Throw MPLS out the window

The pseudo wire application is ridiculous. Providing a Frame Relay
connection across an IP network. This is yet another technology that
alludes John as to why we would want to accomplish this. We're putting
ATM on top of IP (because putting IP on top of ATM does not
work). The people have created a solution and Cisco/Juniper is
implementing it (as opposed to Cisco/Juniper creating a solution for
what the People are really looking for). Way the dog. Same with
2547. If the customer wants to hang himself, let's not give him the
rope to do it. 

 
25   Procket Close Out

The ">" marks a lightreading question that tli is responding to.


> Having Cisco and Juniper as clear number 1 and number 2, meant that
> there was no need for another core router company.

                             Well, I have to respectfully
                             disagree. Yes, when we started, the core
                             looked like a
                             $25B market and there would be plenty to
                             go around. The pressing problem on
                             everyone's mind was being able to produce
                             enough volume to satisfy demand. The
                             incumbents were irritating their
                             customers and given a technological
                             advantage, it
                             seemed like an interesting race.

                             Clearly, no one sets out to intentionally
                             BE number three. That would be insane.
                             But to not get into the fight just
                             because there are already two players is
                             equally
                             foolish. Should Google have given up just
                             because there was Yahoo and Alta Vista?
                             Startups are a risk, unlike GE, and have
                             to be willing to assume those risks to
                             break
                             into the market place. Yes, if you can
                             take on an entire new segment, that's
                             very
                             nice. But if your innovation is best
                             applied in an existing segment, taking
                             the plunge
                             may be the right approach. Yes, it will
                             certainly be harder and riskier and one
                             definitely needs to weigh that in your
                             thinking, but the hard and fast Welch
                             rule is
                             very narrow thinking.

                             Tony



-------------------------------------
> Doing all-custom ASICs to gain a competitive advantage doesn't work
> out because the technology will advance so much during the life-cycle
> of your ASICs so as to eliminate your competitive advantage by the time you reach market.


                             I'm sorry, I'm not buying this at
                             all. Going full custom only takes
                             slightly longer than
                             an ASIC design and yields substantially
                             more value per die mm. Yes, we did not
                             pull
                             this off. We slipped and then we had to
                             spin. Our bad. But we would have been
                             just
                             as badly off if we had slipped and had to
                             spin on an ASIC design. Just because we
                             blew it doesn't mean that everyone would.



> If you ever see a startup that combines bleeding edge ASICS (pushing
> the bloody edge) and a end product made from those ASICs, it will usually
> end in tears. Startups need to minimize cost and risk in ASICs unless the end-product
> itself is an ASIC that can immediatly be sold.

                             I'm not buying this either, this is
                             exactly what Juniper did quite
                             successfully.

> There is a set of well-established math with regards to the economics
> of ASICs. You look at the NRE, the per-unit cost, the expected volume,
> the expected lifetime and the price of substitutes or alternatives.

                             You also look at the functional
                             requirements for being in the market
                             place. You also
                             factor in the value that the entire
                             company brings, not just the breakeven
                             cost for
                             the silicon. Startup funding is to pay
                             for the NRE and is not recouped through
                             the
                             sales price, it gets returned in stock
                             price once you've established a
                             franchise. In
                             other words, it's a long term investment
                             and there's a premium associated with it
                             if
                             you get it right.

> I think procket will be the last routing startup to try and build its own packet
> forwarding chips. That business has to go to the big chip houses
> because no startup can afford the costs, schedules or risks involved in designing them.

                             Last startup? Perhaps. But certainly not
                             the last company to do so. The big chip
                             houses do live on volume, and the volume
                             in the high-end is always low, so the big
                             chip houses do not like to play there. I
                             would expect the incumbents to continue
                             to play this way because there will continue
                             to be no other good alternative. I expect
                             that the next wave of high-end routers
                             will be still done in-house, full-custom
                             at 90nm or smaller.

                             Tony


---------------------------------------------------------------
A cnet interview with tli. The ">" marks cnet's question to tli.

> Juniper is the only core routing vendor to successfully take on
>  Cisco. How did they do it?

 Cisco had annoyed its customers because they had not presented them
 with a reliable and useful core router. Cisco's corporate bureaucracy
 was structured so that people were
 awarded for playing very safely. At the same time, the Internet was
 growing by leaps and bounds. We were basically a roadblock in the
 growth, because we could not get a reasonable
 system to market. It is not that Juniper succeeded so much as Cisco
 failed.

> You left Cisco and went to Juniper, which was then a start-up. Then
> you left Juniper in 1999, just before the IPO. Why?

 It was time for me to move on. I had run into some issues there, and
 it was simply time for me to find other opportunities.

> Didn't you leave a lot of money on the table in terms of stock
> options?

 I left some things on the table, but it was hardly enough that I
 would care. I am one of these strange people who doesn't think this
 is all about the money.

> Procket has raised something like $300 million, and now there's talk
> that the company is trying to sell itself. Could it really be out of
> money? 

 Unless they have raised more funding that is not publicly known, then
 I'd say they need to do something quickly. They should be close to
 running out of money by now.

> People have been saying that Cisco is interested in buying
> Procket. Does this make sense to you?

 I'm not sure what Cisco's rationale is. If it's a matter of improving
 hardware density and getting some software talent, then that makes
 sense. But I don't see how this wouldn't really (anger)
 the team that just built Cisco's new CRS-1 router.

> People say that Procket could be going for between $80 million and
> $100 million. What's your take on that? 

 Well, I'm a bit biased, but I think that's a real steal for the
 technology.

 Procket was one of the most highly valued start-ups in Silicon Valley
 at one point. What happened? 
 There was a lot of mismanagement, especially in the early
 days. Things were delayed, and the sales didn't happen. The product
 ended up being much
 more expensive to develop than we had planned, simply because we were
 not able to execute as we had hoped.

> Were there partnership opportunities that came about and were they missed? 

 A number. But I can't go into them specifically.

> There's been a lot written about the fact that you and the previous
> CEO, Randall Kruep, didn't get along. Is there anything to this? 

 I tried very hard to get along with Randall. That was basically
 rejected out of hand. I had nothing to do with him leaving. I did not
 want him to leave. It was actually sad to see that
 happen.

> Why did you leave Procket? I thought that you were instrumental in
> getting Roland Acra, the new CEO, to come on board. 

 Once he got into the company, he wasn't interested in having my
 help. That was unfortunate.

> Your reputation is that you are a difficult person to work with. Some
> people have called you a "hothead." 

 Well, I am a perfectionist, and I certainly have a temper. Sometimes
 that temper is not well served, and I guess I have the ability to
 irritate people. If people are not willing to have a
 rational discussion with me, then things get very, very difficult. I
 am always pushing to help the company succeed, but some people feel
 their egos need to be served. 

 You are considered one of the leading engineers in the routing
 community. Venture capitalists will pour millions of dollars into a
 start-up just because you're involved. Why do
 you think you are viewed as such a rock star? 
 First of all, I am not a rock star. A lot of this publicity has been
 internally generated. I have had no control over it, and I certainly
 do not deserve it. I am an engineer. My first goal is not to
 sell product, it's to make the customer happy. And I do strange
 things, like tell the truth, which customers appreciate but sometimes
 the company does not. 

> Now that you're done with Procket, what are you working on? 

 I am doing stuff on the side, but it is not of relevance to this
 conversation.

> Do you think you will join another start-up? 

 Quite possibly; I would much rather be in a start-up than a large
 company. My style is much more about getting things done, and I
 prefer the freedom rather than the many layers of
 process that are usually necessary in a big company. I don't have
 anything particular in mind right now, but I am keeping my eyes
 open. 

> What are customers looking for now in a core IP router? 

                            Customers need a system that they can
                            install and have operational in their
                            networks for five to 10 years. That means
                            you need an architecture that is
                            going to be able to sustain Internet
                            growth rates for 10 years without changing
                            the basic infrastructure.

                            What do you think about Cisco's new core
                            router, the CRS-1, which was just
                            introduced last month? The company boasts
                            it can scale to 92
                            terabits per second. 
                            They missed the mark. Although it's
                            significantly bigger than I had originally
                            thought, it should still be an order of
                            magnitude larger. Customers that have
 vision and understand the growth of the Internet will probably be
                            disappointed with this product.

> Right now the market is served by two vendors: Cisco and Juniper. Is
> there room for a third player? 

 Certainly. If you take a look at the traditional telecom market, we
 have always seen a number of players. The question is really who is
 going to have sufficient technology as the Internet
 continues to grow.

> What's the next big trend in IP routing?

 As the Internet grows, we'll see some very interesting things in the
 optical plane. I'm not talking about optical routing so much as
 optical traffic engineering. We've discovered that some
 traffic engineering methods for IP translate directly into the
 optical layer. This would allow carriers to deploy and provision
 optical circuitry at a very rapid rate to reflect changes in traffic
 demand. 

> Would this save carriers money? 

 It should make it cheaper to operate their networks, and it could
 provide a business advantage over competitors. Right now, if a
 customer wants an OC-48 circuit, he has to wait almost
 six months for it to be provisioned. Time is money, and if the
 carrier could get that OC-48 (a 2.5-gigabit-per-second optical
 connection) up in an hour, that might be a business
 advantage.   

26   Packet Processing

In fact, both matter, but the packets/sec is harder to achieve. Consider that for each packet, a router has to perform an IP lookup, make a switching decision and get the packet to the correct output interface with the correct encapsulation. The amount of work is the same regardless of the size of the packet. This leads some manufacturers to skimp on the processing power for packet processing, so they will underperform when tested with small packets. With large packets, the packet processing rate is lower, so it's simply a matter of bandwidth. Most players get that right, or come arbitrarily close.

Tony
