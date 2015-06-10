#!/bin/bash

# $1=cpl $2=desc $3=y $4=m $5=d

gnuplot <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
do for [i=26:29] {
    num=sprintf('%d',i)
    from=sprintf('2015/5/%d 10:00:00',i)
    to=sprintf('2015/5/%d 22:00:00',i)

    set xrange [from:to]
    set yrange [ 0 : 32 ]
    set title "$2 Load Average 5/".num
    set term png notransparent size 1600,1200
    set output '5-'.num.'-$2-cpl.png'
    plot \
    "$1" using 4:8 t 'Lavg 1m'  , \
    "$1" using 4:8 smooth csplines t 'Lavg 1m', \
    "$1" using 4:9 t 'Lavg 5m'  , \
    "$1" using 4:9 smooth csplines t 'Lavg 5m' , \
    "$1" using 4:10 t 'Lavg 15m'  , \
    "$1" using 4:10 smooth csplines t 'Lavg 15m', \
        8 title 'CPUs';

}

do for [i=1:4] {
    num=sprintf('%d',i)
    from=sprintf('2015/6/%d 10:00:00',i)
    to=sprintf('2015/6/%d 22:00:00',i)

    set xrange [from:to]
    set yrange [ 0 : 32 ]
    set title "$2 Load Average 6/".num
    set term png notransparent size 1600,1200
    set output '6-'.num.'-$2-cpl.png'
    #set object 1 rectangle from from, graph 0 to to, graph 1 fs solid fc rgb "red" behind
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


gnuplot <<EOF

set xdata time
set yrange [ 0 : 32 ]
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set title "$2 Load Average"
set term png notransparent size 3200,2400
set output '$3'
set style rect fc lt -1 fs solid 0.15 noborder
set object 1 rectangle from "2015/5/22 10:00:00", graph 0 to "2015/5/22 22:00:00", graph 1
set object 2 rectangle from "2015/5/26 10:00:00", graph 0 to "2015/5/26 22:00:00", graph 2
set object 3 rectangle from "2015/5/27 10:00:00", graph 0 to "2015/5/27 22:00:00", graph 3
set object 4 rectangle from "2015/5/28 10:00:00", graph 0 to "2015/5/28 22:00:00", graph 4
set object 5 rectangle from "2015/5/29 10:00:00", graph 0 to "2015/5/29 22:00:00", graph 5
set object 6 rectangle from "2015/6/1 10:00:00", graph 0 to "2015/6/1 22:00:00", graph 6
set object 7 rectangle from "2015/6/2 10:00:00", graph 0 to "2015/6/2 22:00:00", graph 7
set object 8 rectangle from "2015/6/3 10:00:00", graph 0 to "2015/6/3 22:00:00", graph 8
set object 9 rectangle from "2015/6/4 10:00:00", graph 0 to "2015/6/4 22:00:00", graph 9
plot \
"$1" using 4:8 t 'Lavg 1m'  , \
"$1" using 4:8 smooth csplines t 'Lavg 1m', \
"$1" using 4:9 t 'Lavg 5m'  , \
"$1" using 4:9 smooth csplines t 'Lavg 5m' , \
"$1" using 4:10 t 'Lavg 15m'  , \
"$1" using 4:10 smooth csplines t 'Lavg 15m', \
    8 title 'CPUs';


EOF

gnuplot <<EOF

set xdata time
set yrange [ 0 : 16 ]
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set title "$2 Load Average"
set term png notransparent size 3200,2400
set output 'max16-$3'
set style rect fc lt -1 fs solid 0.15 noborder
set object 1 rectangle from "2015/5/22 10:00:00", graph 0 to "2015/5/22 22:00:00", graph 1
set object 2 rectangle from "2015/5/26 10:00:00", graph 0 to "2015/5/26 22:00:00", graph 2
set object 3 rectangle from "2015/5/27 10:00:00", graph 0 to "2015/5/27 22:00:00", graph 3
set object 4 rectangle from "2015/5/28 10:00:00", graph 0 to "2015/5/28 22:00:00", graph 4
set object 5 rectangle from "2015/5/29 10:00:00", graph 0 to "2015/5/29 22:00:00", graph 5
set object 6 rectangle from "2015/6/1 10:00:00", graph 0 to "2015/6/1 22:00:00", graph 6
set object 7 rectangle from "2015/6/2 10:00:00", graph 0 to "2015/6/2 22:00:00", graph 7
set object 8 rectangle from "2015/6/3 10:00:00", graph 0 to "2015/6/3 22:00:00", graph 8
set object 9 rectangle from "2015/6/4 10:00:00", graph 0 to "2015/6/4 22:00:00", graph 9
plot \
"$1" using 4:8 t 'Lavg 1m'  , \
"$1" using 4:8 smooth csplines t 'Lavg 1m', \
"$1" using 4:9 t 'Lavg 5m'  , \
"$1" using 4:9 smooth csplines t 'Lavg 5m' , \
"$1" using 4:10 t 'Lavg 15m'  , \
"$1" using 4:10 smooth csplines t 'Lavg 15m', \
    8 title 'CPUs';


EOF

