#!/bin/sh -u
#   $0 [atop logfile to plot]

log=${1-'/var/log/atop.log'}

tmp=/tmp/atop-tmp
#rm -f $tmp
#trap "rm -f ${tmp}*" 0 1 2

#atop -PCPL -r "$log" >$tmp
gnuplot -persist <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
do for [i=26:29] {
    num=sprintf('%d',i)
    from=sprintf('2015/5/%d 10:00:00',i)
    to=sprintf('2015/5/%d 22:00:00',i)

    set xrange [from:to]
    set title "Reznov Load Average 5/".num
    set term png
    set output 'reznov_5_'.num.'.png'
    plot \
    "$tmp" using 4:8 t 'Lavg 1m'  , \
    "$tmp" using 4:8 smooth csplines t 'Lavg 1m', \
    "$tmp" using 4:9 t 'Lavg 5m'  , \
    "$tmp" using 4:9 smooth csplines t 'Lavg 5m' , \
    "$tmp" using 4:10 t 'Lavg 15m'  , \
    "$tmp" using 4:10 smooth csplines t 'Lavg 15m', \
        8 title 'CPUs';

}

EOF

#atop -PSWP -r "$log" >$tmp-swp
gnuplot -persist <<EOF

set xdata time
set timefmt '%Y/%m/%d %H:%M:%S'
set format x "%Y\n%m/%d\n%H:%M"
set grid
set title "Reznov Swap"

plot \
    "${tmp}-swp" using 4:(256*\$9/1024**2) smooth csplines t 'Free', \
    "${tmp}-swp" using 4:(256*\$11/1024**2) smooth csplines t 'Committed', \
    "${tmp}-swp" using 4:(256*\$12/1024**2) smooth csplines t 'LimitCommit';

EOF

#atop -PMEM -r "$log" >$tmp-mem
