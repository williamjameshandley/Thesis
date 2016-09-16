import matplotlib.pyplot as plt
import numpy
import scipy.special

tmin = 0
tmax = 5*numpy.pi
x = numpy.linspace(tmin,tmax,1000)

fp = lambda t: numpy.sin(2/3*t**(3/2))

dfp = lambda t: t**1/2*numpy.cos(2/3*t**(3/2))
fm = lambda t: numpy.cos(2/3*t**(3/2))
dfm = lambda t: -t**1/2*numpy.sin(2/3*t**(3/2))

fig, axes = plt.subplots(2,1, sharex=True)

axes[0].plot(x,fp(x),color='black',label=r'$f_+(t) = \sin\left(\frac{2}{3}t^{3/2}\right)$')
axes[0].plot(x,fm(x),color='black',linestyle='dashed',label=r'$f_-(t) = \cos\left(\frac{2}{3}t^{3/2}\right)$')
axes[0].legend()

tj = 4
xj = scipy.special.airy(-tj)[0]
xdotj = -scipy.special.airy(-tj)[1]
Ap = (xdotj * fm(tj) - xj * dfm(tj))/(dfp(tj)*fm(tj)-dfm(tj)*fp(tj))
Am = (xdotj * fp(tj) - xj * dfp(tj))/(dfm(tj)*fp(tj)-dfp(tj)*fm(tj))
f = lambda x: Ap *fp(x) + Am * fm(x)

axes[1].plot(x,scipy.special.airy(-x)[0],'k', label=r'$x(t) = \mathrm{Ai}(-t)$')
axes[1].plot(x,f(x),color='black',linestyle='dashed', label=r'$A_+ f_+(t) + A_- f_(t)$')
axes[1].plot(tj,xj,'ko')
axes[1].legend()

fig.subplots_adjust()
fig.tight_layout()
fig.savefig('matching.pdf')
