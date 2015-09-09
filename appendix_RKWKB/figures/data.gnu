ymin=-1
ymax=1
xwkb = 5E0
xmin = xwkb-5
xmax = xwkb+30
set yrange [ymin:ymax]
set xrange [xmin:xmax]

set label 'RK' at xwkb-1,-0.6 right
set label 'WKB' at xwkb+1,-0.6 left

set arrow from xwkb,ymin to xwkb,ymax nohead

plot 'airy.dat' u 1:2 w l title 'Ai(-t)' ls 2,'data.dat' title 'RKWKB' ps 1.5
