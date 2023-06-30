---
layout: post
title: Designing Data Intensive Applications
tags: system-design
---

# Introduction

This book was recommended by my colleague (Sid if you're ever reading this, thanks!).
I have found this by far to be the most informative book on systems design and this includes the bunch of guides for taking on system design interviews!
The book takes an honest, ground up approach to examine the various components that may make up a system and goes into the intricacies of the widely available options for each component and the use cases they are better suited for.

# Chapter 7: Transactios

## Isolation Levels

Probably one of the more complex topics of ACID (Atomicity, Consistency, Isolation, Durability).
In a nutshell databases can offer these levels of isolation (will add details about how they implement it later):

- Read uncommitted
- Read committed
- Repeatable reads
- Serializable

In order to understand why there is a need for these isolation levels, we need to understand what problems they can cause:

- Dirty reads
  - Another transaction is able to read from a concurrent UNCOMMITTED write
- Dirty writes
  - Another transaction is able to update a value that is concurrently updated but UNCOMMITTED
- Lost updates
  - 2 concurrent transactions performing read modify write (a = a + 1) type of operation; 1 of them gets lost
- Read skew (Non-repeatable reads)
  - There are multiple reads in 1 transaction but a concurrent update got committed in the middle of transaction, causing reading of database in an inconsistent state.
  - Does not have to be the same row, can be different rows.
- Write skew
  - Where the result of a prior read affects the write statement, which affects the read statement.
  - In this example, there will be problems if there are concurrent transactions.
  ```sql
  BEGIN TRANSACTION;
  SELECT * FROM item WHERE owner.id == null;
  UPDATE item owner.id = ? WHERE id = ?, values  (ownerID, itemID);
  COMMIT;
  ```

## Isolation levels and types of concurrency issues you can get

Depending on the type of database you use, the names of the isolation level configuration can be different; _so always read the label_!

I will list the types of problems that one might face with different chosen isolation levels.

### Read uncommitted

Basically no isolation at all, everybody is free to read each other's uncommitted updates. Fine on a small scale I guess. You'll basially face all the above issues mentioned: dirty read/writes, lost updates, read skew, write skew...

### Read committed

Most databases have this level of isolation, this protects developers from _dirty read/writes_.

How does it prevent dirty reads?
Databases will hold an old value of the data while it is being updated. Until the update is committed, it will return the old value. Quite little overhead is involved.

How does it prevent dirty writes?
It delays the writes until the previous transaction is committed. It still ends up in an incorrect state of the data because it is essentially "last write wins", but by definition, it is NOT a dirty write.
We'll talk about preventing lost updates in another section.

### Repeatable Reads

Most databases have this level of isolation as well, but they have different names, so read the label! hur hur.
Repeatable reads level prevent read skews (values that are being read is updated by another committed transaction in the middle of the transaction).
It does so by snapshot isolation and multi-version concurrency control; keeping multiple versions of the values and returning the results from a snapshot of the database when the transaction begun.
In this configuration, the database will only return results that

1. Exists at the beginning of the transaction (and not deleted)
2. Value at the beginning of the transaction (any later updates will not be returned)

In order to achieve this, a monotonically increasing transaction ID will be issued for every transaction and results returned will always be from versions <= `transaction.id`

### Serializable

This level of isolation level is not really commonplace with databases, because of performance issues.

1. Actual serial execution
2. 2 Phase locking
3. Optimistic concurrency control

#### Actual serial execution

In this case, all transactions are encapsulated as stored procedures (functions) in the database and are executed serially and quickly.
Because this removes the http calls to the application in between `SELECT` and `UPDATE`, it is able to run quickly on 1 single core.
This however moves application logic INTO the database and becomes a mess when there are more dependencies built ontop of it.

#### 2 Phase locking

This is the most common solution in place now.

Where the rows that are required for the `SELECT` statement is locked when there is a `UPDATE/INSERT` happening.
This is fine if the rows that are locked are few, but is problematic when plenty of rows are locked. The use of locks also slows concurrency processes down; because it is reduced to a lock at a time.

As an illustration: Imagine if you had to lock all rows that are for a booking between a time period; how many rows is that? To compound that; what if it overlaps with another concurrent transaction? 11am - 12pm & 1145am - 1230pm? One will have to wait for the other transaction to finish before being able to proceed.

#### Optimistic concurrency control

This is a pretty new and smart algorithm that detects if the "predicate" `SELECT` statement has been changed since the transaction started.
If it has not been changed, then it will execute; else it will abort (and you can retry)
Currently it is still young and is undergoing optimization, but it does show a lot of promise because it avoids a lot of the negative performance issues that the other 2 solutions come with.

## Choosing isolation levels

So we now see the types of concurrency problems that we can run into, so why not choose the HIGHEST isolation level available to us and be done?
The reason is: tradeoffs; nothing comes for free.

While serializing transactions gives us the most consistent results, it also reduces our performance to just 1 thread; this is NOT good enough for most standards.
