---
layout: post
title: "Site Reliabilty Engineering"
tags: SRE Devops GoldenSignals
---

## Introduction

This SRE book was written by the SRE teams at Google, illustrating how they managed to keep the services up and running at a high level of availability while at the same time pursuing the highest engineering velocity.

It explains that the incentives of the SRE teams and product development teams are essentially different; SRE teams would like stability and would prefer lower change velocity while development teams want to roll out new features ASAP, causing a misalignment of goals, which, if not addressed early will end up in gatekeeping from the SRE teams and work arounds by the development teams, such as config changes or flags.

Google's approach to this is employing a engineers with software development skills as well as good network level knowledge in order to support development teams with the idea that these engineers will find ways to manage these systems via code.

## Responsibilities of SRE

The following are responsibilites of the SRE team, but they should be borne together with the product development team in order to reach their goals.

- availability
- latency
- performance
- change management
- monitoring
- emergency response
- capacity planning

## Error budget

With the above responsibilites defined, the book also defines a concept called _error budget_ which is the maximum amount of errors that can occur in a period of time. It can be calculated from the following equation: `1 - target availability`.

It is also worth highlighting that 100% availability is never a good target as there are many layers (network connection, router etc) which could fail between the service and the customer that an increased availability actually yields almost no improvement in experience to the customer.

## Objectives

The plan is to reach maximum change velocity while staying close to the _error budget_.

Google does this by employing engineers and capping their actual operational work to 50% so the rest of their time can be spent developing the system to support high change velocity.

## Service Level Indicators

SLIs are metrics that show how well/badly a service is performing and they should be defined together with the product team as they know which are the metrics that can move the needle on the success of the service.

Here are some common metrics for different types of services:

- Availability
- Latency
- Durability (for storage systems)
- Throughput (for data processing)

While it is tempting to list the metrics that can be easily measured and use them to set Service Level Objectives, it might be better to work backwards: decide what kind of metrics would clearly indicate a change in the customer's experience and find a way to measure it.

The way indicators are measured should also be set up clearly for anyone interpreting the results as averages and means can represent totally different situations:

- Service that gets 200 reqs every other second and Service that gets 100 reqs per second will both average to be 100rps
- Means can hide fat tails of latency
- All requests are not equal; some requests contain a larger payload and require longer time for processing should not be bucketed with small and fast requests.

## Service Level Objectives

With the indicators decided, next it is time to set objectives, once again, together with the product managers; to determine what set of indicators will affect the customers the most. It will be better if these indicators were backed up by actual statistics.

Having SLOs help to reduce ambiguities of how performant a service should be and gives consumers of the service a better way of estimating their reliance.

## Service Level Agreements

SLAs are pretty much SLOs with penalties; normally done by the business side of the company with inputs from the engineers.

## Eliminating Toil

Definition of `Toil`:

- manual
- repetitive
- automatable
- lacking in value
- scales linearly

The chapter in the book mainly covers the reasons to eliminate toil as much as we can from work as it can cause low morale, confusion, slow progress and sets precedents for developers to load the SRE team with more toil.

Personally, I believe in automating as much work as possible, as long as they do not require human judgement; the book also mentions that if a system requires too much human judgement, it could also indicate that the system design is flawed and is not scalable long term.

## Monitoring

### White Box v.s. Black Box monitoring

- White box monitoring provides information from within the system: will be useful in supporting diagnoses
- Black box monitoring takes on the POV of an end user
- Use both in conjunction to achieve a good view of the system's performance as well as to provide a good view of the internals

### Golden Signals

- Latency - Time taken to service a request; should also consider including error latency (how long it takes to return an error) as it impacts user experience
- Traffic - Demand of the service: can be measured as requests per second in web applications, can be i/o operations for other services such as storage
- Errors - Rate of service response failures; extra metrics could be required if we are targeting partial failures as well
- Saturation - How much resource is the service consuming and is it reaching its maximum?

For maximum efficacy, there is also a need to choose an appropriate time resolution for these measurements; i.e. no need for every minute sampling if a system is targeting 99.9% availability (9 hours down time).

There is a temptation to create dashboards and metrics for every aspect of the system, but coupled with complex dependent monitors + diagnostic code/metrics, monitoring can quickly grow out of hand, generating more noise than signals.

The mantra should be: _As Simple as possible, no simpler_

Some guidelines for keeping monitoring simple:

- Data collected that are seldom used should be up for removal
- Signals that are collected that are not used in any dashboards should be up for removal

### Reasonable Alerts

To avoid alert fatigue, the following rules should be asked when installing an alert:

- Does this alert detect an otherwise undetected condition and is urgent, actionable and is visible to customers?
- Can/Will I ignore this alert because it is benign? How do I avoid this scenario or remove this false positive?
- Are other people getting paged for this issue? Is that necessary?
- Can the response taken be automated?

To summarise the above, in order for an event to qualify as alertable it has to be:

- Actionable
- Visible to customers
- True positive
- A novel problem that requires intelligence for response

#### Long term plans

Alerts that require attention/action from engineers take up time and energy from engineers as they are busy triaging the alerts; backing off the alerts could allow more time and space for them to fix the root cause of the problem.
