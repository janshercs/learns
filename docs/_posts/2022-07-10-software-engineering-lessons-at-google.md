---
layout: post
title: Software Engineering at Google
tags: engineering principles lessons
---

## Lessons Learned from Programming over time

A little humor there, because they define Software Engineering as programming over time. This book is a compilation of wisdom of x-googlers (xooglers) & googlers over time and they pertain to mostly to policies, tools and best practices in developing code that is meant to live for a long time (possibly infinite).

You are able to view the book online [here](https://abseil.io/resources/swe-book/html/toc.html).

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

### Revisiting Decisions

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
  - Has a narrow scope, easily distributed via emails or messages
- Tech talks
- Documentation
  - Standard go-to for code
- Go/link tools
  - Articles or guides with a simple link in the path so it is the first go to for everyone who seeks to find out more about a certain topic
  - Simple link example would be: go.link/python is the path to the google Python style guide
- Code review certifications (called Readability certifications)
- Online labs
- Email threads
- Classes
  - Due to the high effort required to start classes; the topic should be complex enough and it's reward should be substantial enough to warrant the creation of a class

#### Attributes of different kinds of knowledge medium to consider

- Effort to create
  - Is it easy for people to share their knowledge?
  - How much work has to go into it before it can be launched?
- Effort to maintain
  - Does the information get updated over time? Or does it get frozen and becomes irrelevant?
  - Does maintaining it take a lot of time?
- Accessibility
  - Will the next person with the same question be able to find this easily?
- Engagement
  - How effective is the knowledge transfer going to be?
- Relevance
  - Is the answer specific enough for the question in mind? Or is it too general?

## Style Guide

### Reasons for style guide

- Encourate good behaviour, discourage bad behaviour
- Reduce decision fatigue (e.g. no need to think about formatting)
- Consistency across the organisation

### What warrants inclusion into a style guide?

- They should pull their own weight
  - Meaning it should help improve code quality to a larger extent than the efforts taken to adhere by it.
- Different practices from external community
  - If organisation specific reasons favours a certain rule that is not standard with the external community, it should be included in the guide.
- Optimising Readability
  - Google's code is focused on readability as code is read more than it is written; if a non-obvious rule helps with readability, it should be added to the guide.

### Extra Considerations

- Ubiquitous rules; if everyone using the language knows to avoid it, there's no need to re-state it in the guide
- Consistency with the community: if possible, we should aim to be consistent with the entire community as a whole; easier for experienced developers, easier for open-sourcing a project

### Automate this stuff

- Even better than guides is automation; error checkers, code formatters are exteremely valuable in this aspect as they allow the rules to scale with minimal human effort.
- When rules can be automatically applied, code becomes more consistent and less time is spent debating over non-consequential issues.
- This also allows for many rules to be left out of the style guide as they do not require the human to be aware of it, saving time and effort!
- In a word, automation makes this **Scalable**.

## Code Review

Practice of code review is common in tech industry, different in different companies, I will not be listing the code review work flow down as it is Google specific. Instead I'll cover some of the best practices while reviewing code.

### Aims of code review

- Ensuring correctness (bugs caught earlier reduces cost; there's a whole argument about shifting stuff left in the development process)
- Ensures readability and consistency
- Promotes knowledge transfer
  - As senior engineers critique on code, it's the best time for juniors to learn (and vice versa)

### Best Practices

- Be polite and professional
  - Goes without saying
- Not time for debating design decisions
  - Discussions should have taken place before
- Small changes are preferred
  - Makes things easier for reviewers to read
- Make all comments at once
  - So authors can take in and make edits at the same time instead of having to revisit the same code multiple times
- Split up review responsibilities
  - Reviewers are better able to spot issues if the scope of the review is smaller: i.e. focused on readability, or consistency or business logic
- Automate where possible (linters/formatters/analysis)

### Taking it in the right spirit

Remember the matra:

> You are not your code.

## Testing

### Types of tests

- Small
  - Limited to single process
- Medium
  - Single machine, multiple processes
- Large
  - Different machines, network calls, isolated network

### Attributes of tests

Different types of test differs in

- Scope
- Fidelity
- Speed

### Test Doubles, Mocks, Fakes, Stubs

This topic deserves an entire post and discussion all by itself, and indeed it does have tons of articles (see Martin Fowler's blog). The following is more of my opinion than anything else and I believe each team should decide on how they wish to approach this issue.

The main use of mocks is to remove 3rd party dependencies in a test; examples include io and network calls. While mocking adding stubs to them allows the test to verify that a certain function is called with the required arguments, it does however, test the interaction itself and makes the tests brittle.

Coupled with mocking libraries that make generating mocks trivial, I feel like there is an over use of mocks, leading to brittle tests, which in turn leads to difficulty in refactoring. That being said, there are also benefits that come with using mocks such as being able to instantiate a component in 1 line, where the real thing could require 10+ lines. Using mocks also isolates the system under test (or the component that we are writing tests for).

My **personal** preference is to use the real components where possible and to only add in mocks where there are calls to outside the process, as it preserves the real behaviour where possible and at the same time, tests the behaviour, instead of implementation/interaction of a system.
