---
title: Performance
layout: default
---

## Test Setup
- mpi4py
- serial version (on RPi)
- different number of nodes

## Optimizations
We performed several optimizations in order to improve the performance of our cluster.
1. blah blah blah
2. blah blah blah blah blah

## Speedup
![alt text]({{ site.baseurl }}/images/moon.jpg "To the moon!")

## Efficiency
![alt text]({{ site.baseurl }}/images/eff.jpg "Efficiency!")

## Relative Performance
- Comparison to Laptop
- Comparison to Cluster Serial
- Comparison to Cluster Parallel

## Communication Latency
In order to find any potential bottlenecks, we performed a pairwise profile of our
nodes.
This table provides pairwise communication latency in miliseconds for each pair of nodes.
The takeaway: our slowest pair of nodes can start 35 message transfers in the blink of an eye.

| |0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|0|| ||8||5||5||5||5||5||5||5||5||5||5||5||5||7||5|
|1|| || ||10||10||5||5||5||6||5||5||10||7||10||5||5||5|
|2|| || || ||7||7||7||5||5||5||5||5||8||10||7||10||5|
|3|| || || || ||10||5||10||5||10||10||7||7||10||5||5||5|
|4|| || || || || ||5||5||10||5||5||10||10||5||5||5||7|
|5|| || || || || || ||5||5||10||8||5||5||5||5||5||10|
|6|| || || || || || || ||5||10||10||10||5||5||5||10||5|
|7|| || || || || || || || ||8||10||7||9||8||10||7||5|
|8|| || || || || || || || || ||5||5||5||5||10||5||5|
|9|| || || || || || || || || || ||7||5||5||8||5||5|
|10|| || || || || || || || || || || ||8||5||6||7||5|
|11|| || || || || || || || || || || || ||5||6||5||5|
|12|| || || || || || || || || || || || || ||5||5||7|
|13|| || || || || || || || || || || || || || ||10||8|
|14|| || || || || || || || || || || || || || || ||5|
|15|| || || || || || || || || || || || || || || || |

## Inverse Bandwidth
We compute inverse bandwidth in megabytes per second. Not too shabby.

| |0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|0|| ||3||3||3||3||3||4||3||3||3||3||3||3||3||3||3|
|1|| || ||3||3||3||3||3||3||3||3||3||3||2||3||3||3|
|2|| || || ||3||2||3||3||3||3||3||4||3||3||3||3||3|
|3|| || || || ||3||3||3||3||3||3||3||3||3||3||3||3|
|4|| || || || || ||3||3||3||3||3||3||3||3||3||3||3|
|5|| || || || || || ||3||3||3||3||3||3||3||3||3||3|
|6|| || || || || || || ||3||3||5||3||3||3||3||3||3|
|7|| || || || || || || || ||3||3||3||3||3||2||3||3|
|8|| || || || || || || || || ||3||3||3||3||3||3||2|
|9|| || || || || || || || || || ||3||3||3||3||3||3|
|10|| || || || || || || || || || || ||3||3||3||3||2|
|11|| || || || || || || || || || || || ||3||3||3||3|
|12|| || || || || || || || || || || || || ||3||3||3|
|13|| || || || || || || || || || || || || || ||3||3|
|14|| || || || || || || || || || || || || || || ||3|
|15|| || || || || || || || || || || || || || || || |


## Goals and take-aways
- Built for prototyping parallel algorithms
- Good learning experience for linux-fu, cluster management, understanding hardware. 