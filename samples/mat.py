#!/usr/bin/env python3
import matplotlib
matplotlib.use('module://matplotlib-sixel')
from pylab import *
plt.plot(sin(arange(100) /10))
show()
