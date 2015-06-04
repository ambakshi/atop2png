#!/bin/bash

gnuplot <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set grid
set title "$2 Swap"
set term png notransparent large
set output '$3'

plot \
    "$1" using 4:(256*\$9/1024**2) smooth csplines t 'Free', \
    "$1" using 4:(256*\$11/1024**2) smooth csplines t 'Committed', \
    "$1" using 4:(256*\$12/1024**2) smooth csplines t 'LimitCommit';

EOF


