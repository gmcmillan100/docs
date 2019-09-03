---
layout: page
title: Java
permalink: /java/
resource: true
---

* [Introduction](#introduction)
* [Terminology](#terminology)
* [Class with Method Example](#class-with-method-example)
* [Hello World](#hello-world)
* [Installation](#installation)

# Introduction

Java is a class-based programming language. It's an interpreted language. It compiles to bytecode instead of machine language. Applications are portable between platforms without recompiling. Java apps are compiled to bytecode and run on a Java Virtual Machine (JVM).

Main article: http://introcs.cs.princeton.edu/java/11hello/

# Terminology

* **java**: Java's runtime is named `java`

* **javac**: The compiler for Java

* **javadoc**: Java's documentation builder

* **jar**: Java's archive builder

* **Package**: Package in Java is a mechanism to encapsulate a group of classes, sub packages and interfaces. Packages are used for: Preventing naming conflicts. A Java package organizes Java classes into namespaces, providing a unique namespace for each type it contains. 

* **Class**: A distinct unit of programming. In Java, all code is defined in classes. Create applications by combining classes together. Enables you to create your code in small chunks, which makes it easy to debug.

	```
	public class Main {
		public static void main(String[] args){
			System.out.println("Hello from Java!");
		}
	}
	```

* **Interface**: A contract. It defines a set of methods with specific signatures. Any class that implements this interface must implement those defined methods. It's a guarantee that those methods and other members of the class will be present.

	```
	public interface Product {
		String getType();
		String getSize();
		String getPrice();
	}
	```

* **Method**: Reusable code blocks. These are code blocks you can call from multiple places in an application. Methods are always declared as members of a class.

	```
	public static void main(String[] args){
		for (int i = 0; i < months.length; i++){
			System.out.println(months[i]);
		}
	```

* **Runtime architecture**: 

	```
	+-------------------------------------+
	| Custom-compiled bytecode            |
	+-------------------------------------+
	| Core runtime and addition libraries |
	+-------------------------------------+
	| Java Virtual Machine (JVM)          |
	+-------------------------------------+
	| Operating system                    |
	+-------------------------------------+
	```

# Class with Method Example

A method is a reusable code block. It can be called from multiple places in an application. 

In this example, the method is named `main`. It is called automatically as the class `Main2` is started. This method loops through a list of months and displays them individually. 

```
public class Main2 {

	private static String[] months =
		{"January", "Febrary", "March"};

	public static void main(String[] args){
		for (int i = 0; i < months.length; i++){
			System.out.println(months[i]);
		}
	}
}
```

Do this to run the code:

1. Compile `Main2.java` by using the Java compiler:

	```
	$ javac Main2.java
	```

	After completion, a file named `Main2.class` is created.

2. Run the `Main2` program:

	```
	$ java Main2
	January
	Febrary
	March
	```

# Hello World

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

https://www.linkedin.com/learning/java-essential-training-syntax-and-structure/welcome?u=104

http://www.java-made-easy.com/java-for-beginners.html
http://javabeginnerstutorial.com/core-java/