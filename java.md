---
layout: page
title: Java
permalink: /java/
resource: true
---

Next learning:

http://www.java-made-easy.com/java-for-beginners.html
http://javabeginnerstutorial.com/core-java/


1. Hello World example
2. Install Java



1. Hello World example:

http://introcs.cs.princeton.edu/java/11hello/

1. Create a java program

vim HelloWorld.java

and put this in it:

public class HelloWorld {

    public static void main(String[] args) {
        System.out.println("Hello, World");
    }

}

2. Compile the java program

javac HelloWorld.java

which creates the class file (the computer language version):

HelloWorld.class


3. Execute the java program

$ java HelloWorld
Hello, World



2. Install Java

$ pkg install openjdk8

The OpenJDK® project provides a native open-source implementation of the Java® SE Platfo.

This OpenJDK implementation requires fdescfs(5) mounted on /dev/fd and
procfs(5) mounted on /proc. Add the following lines in /etc/fstab:

	fdesc	/dev/fd		fdescfs		rw	0	0
	proc	/proc		procfs		rw	0	0
