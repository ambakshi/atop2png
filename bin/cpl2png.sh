#!/bin/bash

gnuplot <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
do for [i=26:29] {
    num=sprintf('%d',i)
    from=sprintf('2015/5/%d 10:00:00',i)
    to=sprintf('2015/5/%d 22:00:00',i)

    set xrange [from:to]
    set title "$2 Load Average 5/".num
    set term png notransparent large
    set output num.'-$2-cpl.png'
    plot \
    "$1" using 4:8 t 'Lavg 1m'  , \
    "$1" using 4:8 smooth csplines t 'Lavg 1m', \
    "$1" using 4:9 t 'Lavg 5m'  , \
    "$1" using 4:9 smooth csplines t 'Lavg 5m' , \
    "$1" using 4:10 t 'Lavg 15m'  , \
    "$1" using 4:10 smooth csplines t 'Lavg 15m', \
        8 title 'CPUs';

}

EOF


