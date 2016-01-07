#!/bin/sh

awk '$2 != 0 {print $1, $2}' wave.dat > wave_new.dat
awk '$2 == 0 {print $1, $3}' wave.dat >> wave_new.dat

gnuplot << EOF
	f_old='wave.dat'
	f='wave_new.dat'
	set terminal postscript eps
	set output "wave.eps"
	set ylabel "Signal/V"
	set xlabel "time/secs"
	plot f using 1:2 with lines title f lt rgb "red" , \
	f_old using 1:2 with lines title f_old lt rgb "blue" 
EOF
