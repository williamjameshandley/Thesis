set log xy

set format xy "$10^{%T}$"

set xlabel '$k\eta_0$'
set ylabel ''

set yrange [1e-3:1e2]

plot \
'Ak_RN.dat'                     title 'RST $|A_k|$' w l lt 1 lw 6,\
'Ak_BD.dat'                     title 'HD  $|A_k|$' w l lt 1 lw 1,\
'Ak_RN.dat' u 1:(sqrt(1+$2**2)) title 'RST $|B_k|$' w l lt 2 lw 6,\
'Ak_BD.dat' u 1:(sqrt(1+$2**2)) title 'HD  $|B_k|$' w l lt 2 lw 1
