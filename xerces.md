---
layout: page
title: Xerces
permalink: /xerces/
resource: true
---

Installation
------------
Doc:
file:///usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/doc/html/build-winunix.html#UNIX

Requirements: 

  o Ensure the code version of Xerces and Xalan match
    See http://xml.apache.org/xalan-c/getstarted.html#download

  o Xerces requires the "autoconf" and "gmake" compilers
    to be installed before running the "runConfigure" script.

  o Set this:

    setenv XERCESCROOT /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71


cd /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples
then enter "./runConfigure -pfreebsd"

bsd1 /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples> ./runConfigure -pfreebsd
Generating makefiles with the following options ...
Platform: freebsd
C Compiler: 
C++ Compiler: 
Thread option: none
bitsToBuild option: 32
Extra compile options: 
Extra link options: 
Debug is OFF
/usr/libexec/elf/nm: /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/lib/libxerces-c.so.25.0: File format
 not recognized
C++ compiler not specified...we'll assume that configure will find it...

creating cache ./config.cache
checking for gcc... gcc
checking whether the C compiler (gcc   -w -O  -DAPP_NO_THREADS -DXML_USE_NO_THREADS      ) works... yes
checking whether the C compiler (gcc   -w -O  -DAPP_NO_THREADS -DXML_USE_NO_THREADS      ) is a cross-co
mpiler... no
checking whether we are using GNU C... yes
checking whether gcc accepts -g... yes
checking for c++... c++
checking whether the C++ compiler (c++   -w -O  -DAPP_NO_THREADS -DXML_USE_NO_THREADS      ) works... ye
s
checking whether the C++ compiler (c++   -w -O  -DAPP_NO_THREADS -DXML_USE_NO_THREADS      ) is a cross-
compiler... no
checking whether we are using GNU C++... yes
checking whether c++ accepts -g... yes
checking for a BSD compatible install... /usr/bin/install -c
checking for autoconf... true
checking for floor in -lm... yes
checking for pthread_create in -lpthread... no
checking for pthread_create in -lpthreads... no
checking how to run the C preprocessor... gcc -E
checking for inttypes.h... yes
checking host system type... i386-unknown-freebsd4.10
updating cache ./config.cache
creating ./config.status
creating Makefile
creating SAXCount/Makefile
creating SAX2Count/Makefile
creating DOMCount/Makefile
creating SAXPrint/Makefile
creating SAX2Print/Makefile
creating DOMPrint/Makefile
creating MemParse/Makefile
creating Redirect/Makefile
creating PParse/Makefile
creating StdInParse/Makefile
creating EnumVal/Makefile
creating SEnumVal/Makefile
creating CreateDOMDocument/Makefile
creating SCMPrint/Makefile
creating PSVIWriter/Makefile

Having build problems? Read instructions at http://xml.apache.org/xerces-c/build.html

In future, you may also directly type the following commands to create the Makefiles.

export THREADS="none"
export BITSTOBUILD="32"
export CC=""
export CXX=""
export CXXFLAGS=" -w -O -DAPP_NO_THREADS -DXML_USE_NO_THREADS "
export CFLAGS=" -w -O -DAPP_NO_THREADS -DXML_USE_NO_THREADS "
export LDFLAGS=" "
export EXTRA_LIBS=" "
configure

If the result of the above commands look OK to you, go to the directory
/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples and type "gmake" to make the samples.



bsd1 /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples> gmake
Building SAXPrint
gmake -C SAXPrint 
gmake[1]: Entering directory `/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples/SAXPrint'
mkdir -p /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/bin/obj/SAXPrint
c++ -c -DFREEBSD -fPIC -I. -I/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/include -c -w -O  -DAPP_NO_THREADS -DXML_USE_NO_THREADS   -o /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/bin/obj/SAXPrint/SAXPrint.o /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples/SAXPrint/SAXPrint.cpp
In file included from /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/include/xercesc/util/XMemory.hpp:65,
                 from /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/include/xercesc/util/XMLException.hpp:64,
                 from /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/include/xercesc/util/PlatformUtils.hpp:65,
                 from /usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples/SAXPrint/SAXPrint.cpp:147:
/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/include/xercesc/util/XercesDefs.hpp:290: xercesc/util/Platforms/FreeBSD/FreeBSDDefs.hpp: No such file or directory
gmake[1]: *** [/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/bin/obj/SAXPrint/SAXPrint.o] Error 1
gmake[1]: Leaving directory `/usr/xerces/xerces-c_2_5_0-redhat_72_64-ecc_71/samples/SAXPrint'
gmake: *** [saxprint] Error 2
