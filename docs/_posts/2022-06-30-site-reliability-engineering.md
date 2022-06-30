---
layout: post
title:  "Site Reliabilty Engineering"
tags: SRE Devops GoldenMetrics
---
## Introduction
This SRE book was written by the SRE teams at Google, illustrating how they managed to keep the services up and running at a high level of availability while at the same time pursuing the highest engineering velocity.

It explains that the incentives of the SRE teams and product development teams are essentially different; SRE teams would like stability and would prefer lower change velocity while development teams want to roll out new features ASAP, causing a misalignment of goals, which, if not addressed early will end up in gatekeeping from the SRE teams and work arounds by the development teams, such as config changes or flags.

Google's approach to this is employing a engineers with software development skills as well as good network level knowledge in order to support development teams with the idea that these engineers will find ways to manage these systems via code.

## Responsibilities of SRE
The following are responsibilites of the SRE team, but they should be borne together with the product development team in order to reach their goals.
* availability
* latency
* performance
* change management
* monitoring
* emergency response
* capacity planning

## Error budget
With the above responsibilites defined, the book also defines a concept called _error budget_ which is the maximum amount of errors that can occur in a period of time. It can be calculated from the following equation: `1 - target availability`.

It is also worth highlighting that 100% availability is never a good target as there are many layers (network connection, router etc) which could fail between the service and the customer that an increased availability actually yields almost no improvement in experience to the customer.

## Objectives 
The plan is to reach maximum change velocity while staying close to the _error budget_.

Google does this by employing engineers and capping their actual operational work to 50% so the rest of their time can be spent developing the system to support high change velocity.

## Service Level Indicators
SLIs are metrics that show how well/badly a service is performing and they should be defined together with the product team as they know which are the metrics that can move the needle on the success of the service. 

Here are some common metrics for different types of services:
* Availability
* Latency
* Durability (for storage systems)
* Throughput (for data processing)

While it is tempting to list the metrics that can be easily measured and use them to set Service Level Objectives, it might be better to work backwards: decide what kind of metrics would clearly indicate a change in the customer's experience and find a way to measure it.

The way indicators are measured should also be set up clearly for anyone interpreting the results as averages and means can represent totally different situations:
* Service that gets 200 reqs every other second and Service that gets 100 reqs per second will both average to be 100rps
* Means can hide fat tails of latency
* All requests are not equal; some requests contain a larger payload and require longer time for processing should not be bucketed with small and fast requests.

## Service Level Objectives
With the indicators decided, next it is time to set objectives, once again, together with the product managers; to determine what set of indicators will affect the customers the most. It will be better if these indicators were backed up by actual statistics.

Having SLOs help to reduce ambiguities of how performant a service should be and gives consumers of the service a better way of estimating their reliance.

## Service Level Agreements
SLAs are pretty much SLOs with penalties; normally done by the business side of the company with inputs from the engineers.
