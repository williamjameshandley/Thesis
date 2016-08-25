set format '$10^{%T}$'
set logscale xy
#set xrange [10**(-6):10**(3)]
ymin = 1e-1
ymax = 1e3
set yrange [ymin:ymax]

set xlabel '$k/(\mathrm{Mpc})^{-1}$'
set ylabel '$P_\mathcal{R}(k)/\mu^2 $'

set object rect from 1e-3,ymin to 2e0,ymax fc lt -1 fs solid 0.15 noborder behind
set arrow nohead from 0.05,ymin to 0.05,ymax lt 3

set label  '$V(\phi) = \mu^2\phi^2$' at 1e13,1e7
set label  '$k_* = 0.05\:\mathrm{Mpc}^{-1}$' at 0.05,ymin left offset 0.5,1 front

plot "new_CSdata.phi2.dat" u 1:2 w l lt 1 title 'approximate', '' u 1:3 w l lt 2, 'accurate'
