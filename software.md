---
title: Software
layout: default
---

## Operating System
Because of its ease of install and driver support for the Raspberry Pis, we opted for the [Raspbian linux distribution](http://www.raspberrypi.org/downloads) as our operating system. Raspbian is built on Debian and comes pre-packaged with some of the software we needed to create the cluster. Note: there are hardware float ABI and software float ABI versions of Raspbian. The hardware float ABI version utilizes the floating point registers rather than using integer registers and converting to and from floats using software. This was an important optimization for when building a cluster for scientific computing.

## OpenMPI
[Open MPI](http://www.open-mpi.org/) is the de facto open source MPI-2 implementation. With precompiled binaries for ARM processors in the Raspbian package management system, it's an obvious choice for parallel algorithms. We built our solution on version 1.4.5. As we learned, if you plan on using a headnode that is not a Pi, you'll have to make sure that your Open MPI version matches.

## Python
Raspbian comes with [Python 2.7](http://www.python.org/) installed already, so there's no setup to do here.

## mpi4py
[mpi4py](http://mpi4py.scipy.org/) is a Python package that lets Python applications utlizie the MPI standard for message passing. It's easily installed on Raspbian through apt-get. If you haven't installed openmpi yet, the below command will handle that dependency for you.
{% highlight bash %}
sudo apt-get install python-mpi4py
{% endhighlight %}

## SSH
On our cluster, MPI is configured to use SSH as its protocol to pass messages between nodes.
- Use the same keys
- Disable some authentication safeguards (this is ok since we are not on the internet)

## XHPL
In order to clock the performance of our cluster in such a way that it can be compared to other clusters, we downloaded and installed [linpack](http://www.netlib.org/benchmark/hpl/).

To install linpack we do the following:
{% highlight bash %}
sudo apt-get install openmpi-dev libatlas-base-dev gfortran

tar xf hpl-2.1.tar.gz
cd hpl-2.1/setup
sh make_generic
cd ..
cp setup/Make.UNKNOWN Make.rpi
{% endhighlight %}

Then we made the following changes to Make.rpi:


ARCH         = rpi
TOPdir       = $(HOME)/hpl-2.1
MPlib        = -lmpi
LAdir        = /usr/lib/atlas-base/
LAlib        = $(LAdir)/libf77blas.a $(LAdir)/libatlas.a
