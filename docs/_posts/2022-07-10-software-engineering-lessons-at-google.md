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

## How to work with others

The chapter begins with a great point:

> ... it makes better sense to focus on the one variable over which you definitely have control: you.

We can certainly control our own behaviour and so we should start there for it is a sure win if we are able to control ourselves.

### The Genius Myth

For way too long we have been trying/idolising the geniuses. The myth is that a **Genius** will come up with an idea, work on it alone and unveil their works to the world while the world marvels at their creation.

The truth is that nobody goes at it alone anymore and people NEED to work in a team, but this has not stopped the myth of the Genius from perpetrating. While being a genius is nice, chances are, we are not geniuses, statistically speaking (or at least I'm sure I'm not one).

Not being a genius means I'll need all the help and guidance that I can get, and nobody likes to help a jerk!

### It's all about the team

3 most important aspects of working well in a team:

1. Humility
2. Respect
3. Trust

#### Patterns and Anti-patterns on how to behave in the team

These behaviours taken from the book are closely related to the principles mentioned above.

**Good Behaviour**

- Be open to influence
- Be ok to admit knowledge gaps: shows that you are open to criticism and truthful; no one can know everything.

**Anti Behaviour**

- Hiding and working in silo
  - Bus factor: what happens if you are unable to continue to work on the project due to any incident in life?
  - No feedback loop; what you are building might not be the desired product afterall
- Egotistical behaviours:
  - Having to say something all the time: Shows that you have there is an ego you'd like to salve
  - Needing to have a last say in all matters

## Knowledge Sharing

As the organisation/team grows, so do the amount of knowledge. The ability to share knowledge within the organisation can make or break it, as no external parties will understand the problems as well as those internally.

### Challenges faced

- Psychology safety
- Information islands
- Single point of failure
- All or nothing knowledge expertise
- Parroting - mimicry without understanding
- Haunted graveyards/code - Nobody dares to touch parts of the code in fear of breaking things.

### Overcoming Challenges

#### Culture

- Mentorship
- Banning unhelpful behaviour
  - The team can be reduced to its most toxic members
  - A few of these members can make the environment unwelcoming and new members stop trying to get help from within the team.
- Canonical sources of information: standard information that applies to everybody in the organisation.

#### Tools of Distributing Knowledge

- Newsletters
- Lessons/Tech talks
- Documentation
- Go/link tools
- Code review certifications
