---
layout: page
title: Java
permalink: /java/
resource: true
---

* [Hello World](#hello-world)
* [Installation](#installation)

# Hello World

Java is a class-based programming language. Java apps are compiled to bytecode and run on a Java Virtual Machine (JVM).

Main article: http://introcs.cs.princeton.edu/java/11hello/

1. Create a Java program:

	```
	vim HelloWorld.java
	```

and put this in it:

	```
	public class HelloWorld {

	    public static void main(String[] args) {
	        System.out.println("Hello, World");
	    }

	}
	```
2. Use `javac` to compile the Java program:

	```
	javac HelloWorld.java
	```

A class file (the computer language version) will be created:

	```
	HelloWorld.class
	```

3. Execute the program:

	```
	$ java HelloWorld
	Hello, World
	```


# Installation

Do this:

	```
	$ pkg install openjdk8
	```

The OpenJDK project provides a native open-source implementation of the Java® SE Platfo.

This OpenJDK implementation requires fdescfs(5) mounted on /dev/fd and
procfs(5) mounted on /proc. Add the following lines in `/etc/fstab`:

	```
	fdesc	/dev/fd		fdescfs		rw	0	0
	proc	/proc		procfs		rw	0	0
	```

# Next Learning

http://www.java-made-easy.com/java-for-beginners.html
http://javabeginnerstutorial.com/core-java/