import matplotlib.pyplot
import numpy
from scipy.special import hankel2 as H2

ks, Ps = numpy.array([[float(k), float(P)] for k, P in [line.split() for line in open('CSdata.phi2.dat')]]).T


fig = matplotlib.pyplot.figure()
ax = fig.add_subplot(1,1,1)

def Cc(x):
    return numpy.exp(- 1j * x) * ( H2(0,x/2)  - (1/x + 1j) * H2(1,x/2))

def Dc(x):
    return numpy.exp(+ 1j * x) * ( H2(0,x/2)  - (1/x - 1j) * H2(1,x/2))



A_s = 1e2
n_s = 0.96
k_s = 0.05

k_c = 1e-5

def P(k):
    return A_s * (k/k_s)**(n_s-1) * numpy.pi/16 * k/k_c * abs(Cc(k/k_c) - Dc(k/k_c))**2

modPs = P(ks)

with open('new_CSdata.phi2.dat','w') as f:
    for row in zip(ks,Ps,modPs):
        f.write("%e  %e  %e\n" % row)

#ax.plot(ks,Ps)
#ax.plot(ks,P(ks))
#ax.set_xscale('log')
#ax.set_yscale('log')
#ax.set_xlim([1e-6,1e-2])
#ax.legend()

#matplotlib.pyplot.show()

