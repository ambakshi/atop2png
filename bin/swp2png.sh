#!/bin/bash

gnuplot <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set xrange ["2015/5/26 10:00:00":]
set grid
set title "$2 Swap"
set xrange [ "2015/5/26 10:00:00": "2015/6/4 23:59:59" ]
set term png notransparent large
set output '$3'

plot \
    "$1" using 4:(256*\$9/1024**2) smooth csplines t 'Free', \
    "$1" using 4:(256*\$11/1024**2) smooth csplines t 'Committed', \
    "$1" using 4:(256*\$12/1024**2) smooth csplines t 'LimitCommit';

EOF


