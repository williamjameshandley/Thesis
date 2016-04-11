
xwkb = 5E0
ymin = 1e-4
ymax = 1e-3

xmin = 1e-1
xmax = 1e8

set log xy

set yrange [ymin:ymax]
set xrange [xmin:xmax]

set xlabel '$t$'
set ylabel 'relative error $\varepsilon$'

set format x '$10^{%T}$'
set format y '$10^{%T}$'

set label 'RK' at xwkb/2,2e-4 right
set label 'WKB' at xwkb*2,2e-4 left

set arrow from xwkb,ymin to xwkb,ymax nohead


plot 'error.dat' w l notitle, '' notitle
