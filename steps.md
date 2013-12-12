---
title: Step-by-step
layout: default
---

## Image the SD cards
- Donwload the [Raspbian OS](http://www.raspberrypi.org/downloads)
- Insert an SD card into your card reader.
- Create a master image. On OS X you can use the following:

{% highlight bash %}
# find sd card
diskutil list

sudo dd of=/dev/rdisk1 if=~/rpi_mpi.img bs=1m
{% endhighlight %}

- Connect keyboard, mouse, display
- if you need gui (e.g., gtk for matplotlib output) run
{% highlight bash %}
startx
{% endhighlight %}
- On the master node, install the necessary [software]({{ site.baseurl }}/software.html). Here is our final [image](http://people.seas.harvard.edu/~bull/rpi_mpi_8.img.zip).
- Next, you want to copy this image to the other SD cards

{% highlight bash %}
# copy master image locally note change disk1 -> rdisk1
sudo dd if=/dev/rdisk1 of=~/rpi_mpi.img bs=1m
{% endhighlight %}

- Then, for every sd card (i.e., each node in the cluster)

{% highlight bash %}
# update image using script
python setup_node.py rpi_mpi.img 1 #Here, 1 is an ID for the node

# copy master image locally note change disk1 -> rdisk1
sudo dd of=/dev/rdisk1 if=~/rpi_mpi.img bs=1m
{% endhighlight %}

## Create the Hardware Connections
### Wire the Network
- static IP created in setup
- 10/100 Ethernet (so not the fastest)
- Put on simple network switch (no internet, no dhcp)

### Power the Devices
- We used USB power hubs
- According to docs, each pi needs around 500-1000 mA, 5V

## Run MPI
{% highlight bash %}
mpiexec --machinfile ~/machinefile -n 4 python hellompi.py
{% endhighlight %}