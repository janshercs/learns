---
layout: post
title: Working with Legacy Code
tags: refactoring legacy_code
---

# Introduction

> All code is legacy code once written.

This is something my manager told me once: and there's so much truth to that! There have been times when I looked at a piece of code, thought it was garbage and must have been written a long time ago, only to find out that it was written last month! Some times by me!

I suppose it is easy to call something legacy code when you don't understand it at one glance so you don't feel bad! Nonetheless, there is a job to be done and if a legacy code needs to be modified, it needs to be modified.

The purpose of this book is to teach us how to work with legacy code **safely** and hopefully in time, make our codebase a little better!

# What is Legacy Code?

By the Author's definitiion, it is code that do not have tests. I kind of agree with this: without tests, it is impossible to know if your modifications/refactoring are correct. When approaching legacy code without tests, the author says there are 2 ways of approaching this: **edit and pray (I prefer: spray and pray)** or **cover and modify**.

Needless to say, the latter approach is preferred, especially if the code is in production and will be living for a long time: time invested in writing tests could save hours in debugging or spent writing incident reports in the future. There are a lot more benefits to having tests such as acting as a software vise (keeps behaviour in place), but I shall leave test related discussions to a testing focused book.

# How to approach

Of course saying test first is easy, but getting a large class with multiple dependencies into a test is easier said than done. Having dependencies are a blocker to tests because we might not be able to instantiate them without using real databases, env configs etc.

The best way of breaking such dependencies and getting legacy code into tests is through using test doubles. Personally I'm not a big fan of heavily mocked tests, because they get really brittle, but I'm even more opposed to working on untested code! SO, if using a mock object helps to get the system into a test: go for it!

Some times code is too intertwined to be tested in isolation; in that case we might have to do small refactorings without writing tests (_gasps_!). In these cases, try to make the changes as small as possible and just enough so we can get them into tests.

# Seams

The book mentions 3 different seam types:

- Preprocessing
- Link
- Object

Preprocessing seam changes the item under test during compile phase: i.e. compiling for a test. Link seam changes the package imported after compiling so it swaps the package for a testing package. These are more applicable to old school languages such as c++ & java.

For newer languages such as JS, Python, Go with good testing frameworks around (or built into the language), **Object Seam** is the most useful. As you can imagine, it involves isolating the object in question and testing its behaviours.

## Getting stuff into tests

### Breaking dependencies

Some times components are directly dependent on other components that we do not want to use during testing (HTTP client, Databases), and this is a blocker in getting the class into tests. In these cases we can use the idea of dependency inversion to get ourselves out of this bind! Consider the following example:

```go
type UserSystem struct {
	db sql.DB
}
```

Now the user has to pass an actual db into the struct during tests! In order to break the dependency, we can create and use small interfaces like this:

```go
type UserSystem struct {
	db driver.Tx
}
```

so now we can pass in anything that implements the [driver.Tx](https://pkg.go.dev/database/sql/driver#Tx) interface as a db and it is now possible to pass in a test double!

Some times they are something like a custom class: you may use refactoring tools such as `extract interface` (sounds like something fancy from JetBrains for Java! There's nothing available for Go for now)

### Embedded Constructors

Some times the dependencies can be hidden within the constructors for certain classes! In these cases we can consider to `parameterize the constructor`.

```go
func NewUserSystem() *UserSystem {
		return &UserSystem {db: InitDB()}
}
```

In this case, the initiation of the DB is hidden within the constructor code, leaving us no seam to swap it out for a fake!

Here we can create a seam by moving the db into the constructor like so:

```go
func NewUserSystem(db driver.Tx) *UserSystem {
		return &UserSystem {db: db}
}
```

In doing so, we have changed the signature of the constructor function, which goes against making as little change as we can during refactorings! We can fix it with this nifty trick that is similar to the `wrap method` below!

```go
func NewUserSystem() *UserSystem {
		return NewUserSystemFromDB(InitDB())
}

func NewUserSystemFromDB(db driver.Tx) *UserSystem {
		return &UserSystem {db: db}
}
```

By changing the names of the function and wrapping the new constructor function with the old function, it preserves the signatures, but at the same time creates a new constructor to use for tests!

## Making changes to the code

Assuming we were able to get the code under test for the behaviours we want to keep constant (or just gave up on that and just want to test the newly written code), here are a few strategies to reduce the impact of adding new code (read: make it less messy).

### Sprout

Basically identifying where you need to add some code, making a new method for the code you need to add, and **sprout** it as a line in the old code! It's a good strategy because it reduces the intertwining of old and new code and allows your new method to be tested more easily.
An example:

```go
// Old code:
function PayEmployee(...) {
		//Loads of code
		employee.Pay()
		//More code
}

// New code:

function PayEmployee(...) {
		//Loads of code
		employee := employee.Pay()
		Log(file, employee)
		//More code
}

function Log(file, employee string){
		...// needed new code
}
```

### Wrap

This technique **wraps** the old code, changes the name of the old code and calls both the new code and old code using the old function name!

```go
// Old code:
function PayEmployee(...) string {
	//Loads of code
	employee.Pay()
	//More code
}

// New code:
function PayEmployee(...) {
	employee := dispatchPay(...)
	Log(file, employee)
}

function dispatchPay(...) string {
	//Loads of code
	employee.Pay()
	//More code
}

function Log(file, employee string){
	...// needed new code
}
```
