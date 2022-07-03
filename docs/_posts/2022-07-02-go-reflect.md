---
layout: post
title: Go Reflect
tags: Go Types Reflect
---

# Go Reflect: what's in your variable?

## Introduction

I encountered a couple of situations at work where I needed to compare 2 different yaml files, due to rearrangement of keys when yaml files are read into structs in Go. While there are lots of good diff-ing libraries/binaries out there for use; I thought it would be a good exercise to write one myself.

As the aim of this binary is to read any 2 yaml files and print out the differences, there is no struct that can represent the data read and we can only use the Go `interface{}`. In order to compare the 2 different `interfaces`, we will have to make use of the `reflect` package within Go.

## Learnings from pre-reading

There is a great [blog post](https://go.dev/blog/laws-of-reflection) from one of the creators of Go, Rob Pike. The single most important takeaway from this blogpost is:

> One important detail is that the pair inside an interface variable always has the form (value, concrete type) and cannot have the form (value, interface type).

## Learnings while implementing

- reflect.MapKeys() (_works only on Maps_) gives you keys to the map as []reflect.Value
- reflect.Value is more like a pointer, rather than a value: comparing them might not get you the result that you expect, it's probably better to compare their interfaces (next point)
- You can convert them back to interface{} by the method `.Interface()`
- Essentially there are only so many primitive types in Go, and even less that are used to represent yaml/json, they are namely:
  - **primitives**
    - string
    - int
    - float
    - bool
  - **containers**
    - map
    - array/slice
    - struct (not when unmarshalling unknown json/yaml files)
- Use `reflect.ValueOf(...)` to examine the internals (type and value) of an interface{}
- Use `reflect.TypeOf(...)` to examine the `type` of an interface{}

## Cobbling together a barely functioning prototype

I managed to create a script (_in an evening_) that compares 2 yaml files for semantic equivalence (and outputs the differences with no order for now...), using the reflect package.

It's not even a quarter baked nor have I thoroughly tested it: but it works for nested fields and does not mind the order of keys. A lot more work is needed for it to become a real package and there are already plenty of such packages available (hosted online tools even). It was just a nice exercise for me to get to know the Go types a liiiiiitle bit better.

In case anyone is interested, the code can be found [here](https://github.com/janshercs/go_play/tree/main/yaml_diff).
