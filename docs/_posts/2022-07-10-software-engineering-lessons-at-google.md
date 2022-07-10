---
layout: post
title: Software Engineering at Google
tags: engineering principles lessons
---

## Lessons Learned from Programming over time

A little humor there, because they define Software Engineering as programming over time. This book is a compilation of wisdom of x-googlers (xooglers) & googlers over time and they pertain to mostly to policies, tools and best practices in developing code that is meant to live for a long time (possibly infinite).

## It all depends on the time and scale

The book makes the case that best practices for a block of code or a software project depends on the expected time that the project is to live and the scale which it is to be implemented at; as a 2 day hackathon project has very different requirements and considerations from writing the file system binary for a linux kernel.

It makes the distinction between programming and software engineering:

- **Programming** - Is the act of producing code to fulfil a purpose
- **Software Engineering** - Is the set of policies, tools & practices necessary to make the code useful for it's expected lifespan and to allow the scaling up of manpower working on it.

## Maintainability/Changes

A big part of maintaining a code base is for it to allow for changes/upgrades over time. Reasons for allowing and planning for changes include patching for vulnerabilities and changing dependencies within the codebase. The main point of software is so that they are soft and malleable; they should be able to be changed in order to adapt to newer circumstances.

Frequent upgrades in dependencies (policy) and automated testing (tool) will allow for system to be more hardened and less susceptible to breakages. Putting off upgrades will only cause them to accumulate and cause even more hurt as the code changes and grows more dependent on the depenencies staying the same. Frequent changes will enforce an attitude in developers to make their code less dependent.

## Scaling and Efficiency

As the organisation grows/is expected to grow, there should be considerations for the resources required for new members and if the growth of the organisation is sustainable, in terms of

- Time (onboarding time)
- Work processes (multiple people contributing to the same codebase)
- Compute resources

## Making Data Driven Decisions

Decisions made should be made as far as possible with objective data such as:

- Engineering Man Hours
- CPU time
- RAM memory
- Cost to Business
- etc...

In order to make evidenced based decisions, it is important to monitor and to collect metrics where possible.

What is monitored and tracked gets attention: without monitoring important metrics and indicators of work efficiency in the work place, it is easy for problems to accumulate.

> Problems can easily worsen slowly (over time) and never manifest as a single moment of crisis.

Reasons such as

> "Because I said so."

> "It has always been done this way."

> "Because everyone else does it this way."

are places where bad decisions lurk.

### Revisitng Decisions

Once decisions are made, and new data comes in, decisions should be revisited to decide if prior assumptions still hold and new decisions should be taken if there are significant differences.
