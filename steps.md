---
title: Step-by-step
layout: default
---

## Image the SD Cards
- Create a master image (link to ours)
- Image all the sd cards using dd

{% highlight bash %}
# find sd card
diskutil list

# copy master image locally note change disk1 -> rdisk1
sudo dd if=/dev/rdisk1 of=~/rpi_mpi.img bs=1m
{% endhighlight %}

- Then, for every sd card (i.e., each node in the cluster)

{% highlight bash %}
# update image using script
python setup_node.py rpi_mpi.img 1

# copy master image locally note change disk1 -> rdisk1
sudo dd if=/dev/rdisk1 of=~/rpi_mpi.img bs=1m
{% endhighlight %}

## Create the Hardware Connections
### Wire the Network
- static IP created in setup
- 10/100 Ethernet (so not the fastest)
- Put on simple network switch (no internet, no dhcp)

### Power the Devices
- We used USB power hubs
- According to docs, each pi needs around 500-1000 mA, 5V

## Select a headnode
- Connect keyboard, mouse, display
- if you need gui (e.g., gtk for matplotlib output) run
{% highlight bash %}
startx
{% endhighlight %}

## Run MPI
{% highlight bash %}
mpiexec --machinfile ~/machinefile -n 4 python hellompi.py
{% endhighlight %}