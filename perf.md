---
title: Performance
layout: default
---

## Optimizations
We performed several optimizations in order to improve the performance of our cluster.
1. We decrease the video RAM allocation from 256 Mb (out of 512 Mb total) to 16 Mb
2. We overclock the processesors to 950 MHz. Although, we attempted to to overclock the Raspberry Pis to 1,000 MHz, this caused system instability.
3. We use a Linux kernel flag to optimize the ethernet controller by not waiting for extra frames.
4. We network statically to avoid DHCP lookup.
5. We change SSH security settings to avoid extra networking overhead

## Relative Performance
We compared the performance of our Raspberry Pi cluster to a Core i7 Macbook Pro for two of the CS 205 homework problems:
![alt text]({{ site.baseurl }}/images/mbp.png "Relative performance")

## Speedup and Efficiency
For one of the homework problems (computing the Mandelbrot set) we also looked at speedup and efficiency of our cluster:
![alt text]({{ site.baseurl }}/images/mandel_perf.png "Speedup and Efficiency")

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

We also compare communication latency to the CS 205 cluster and an EC2 cluster setup with starcluster. For both of these clusters, we checked the performance with round robbin and fill-in.
![alt text]({{ site.baseurl }}/images/latency.png "Latency")

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

Here's a comparison of the inverse bandwidth of our Raspberry Pi cluster with the CS 205 cluster and the EC2 cluster:
![alt text]({{ site.baseurl }}/images/invbw.png "Inverse Bandiwdth")

## A Few Other Measures
In terms of GFLOPs/Cu.Ft. The Raspberry patch loses out to a server rack fitted with Intel CPUs:
![alt text]({{ site.baseurl }}/images/pervolume.png "Volume")

If we look at our power consumption, we still can't beat out a core-i7 cluster in terms of GFLOPs/Watt:
![alt text]({{ site.baseurl }}/images/perwatts.png "Power")

However, on the next graph, lower is better. This is the cost to replace a node if one of the cores fails:
![alt text]({{ site.baseurl }}/images/nodecost.png "Inverse Bandiwdth")

Finally, a victory!