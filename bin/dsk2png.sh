#!/bin/bash

gnuplot <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set xrange [ "2015/5/26 10:00:00": ]
set grid
set title "$2 Disk"
set yrange [0:30]
set term png notransparent size 3200,2400
set output '$3'
set style rect fc lt -1 fs solid 0.15 noborder
set object 1 rectangle from "2015/5/26 10:00:00", graph 0 to "2015/5/26 22:00:00", graph 1
set object 2 rectangle from "2015/5/27 10:00:00", graph 0 to "2015/5/27 22:00:00", graph 2
set object 3 rectangle from "2015/5/28 10:00:00", graph 0 to "2015/5/28 22:00:00", graph 3
set object 4 rectangle from "2015/5/29 10:00:00", graph 0 to "2015/5/29 22:00:00", graph 4
set object 5 rectangle from "2015/6/1 10:00:00", graph 0 to "2015/6/1 22:00:00", graph 5
set object 6 rectangle from "2015/6/2 10:00:00", graph 0 to "2015/6/2 22:00:00", graph 6
set object 7 rectangle from "2015/6/3 10:00:00", graph 0 to "2015/6/3 22:00:00", graph 7
set object 8 rectangle from "2015/6/4 10:00:00", graph 0 to "2015/6/4 22:00:00", graph 8

plot "$1" using 4:(\$10/30720) smooth csplines t 'Mb/r' ,\
    "$1" using 4:(\$12/30720) smooth csplines t 'Mb/w' ;


EOF
