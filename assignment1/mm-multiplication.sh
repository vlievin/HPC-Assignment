#!/bin/bash

MSIZE=( 10 100 200 300 500 1000 3000 )

# L1 cache is 64 kB
BSIZE=( 80 100 200 500 )
METHOD_1=( nat lib )
METHOD_2=( mkn )

out=output_undefined.dat

	usage="usage: ./send2server.sh -o output_file -1 [-2] [-3]"
	while getopts "o:123h" options; do
		case $options in
			o )
				out=$OPTARG
				;;
			1 )
				for i in ${METHOD_1[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio $i $j $j $j >> "$out"
					done
				done

				# try non-square matrix
				./matmult_c.studio nat 5 100 250 >> "non_sq-$out"
				./matmult_c.studio lib 5 100 250 >> "non_sq-$out"
				./matmult_c.studio nat 100 5 250 >> "non_sq-$out"
				./matmult_c.studio lib 100 5 250 >> "non_sq-$out"
				;;
			2 )
				for i in ${METHOD_2[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio $i $j $j $j >> "$out"
					done
				done
				;;
			3 )
				for i in ${BSIZE[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio blk $j $j $j $i >> "$out"
					done
				done

				# try non-square matrix
				./matmult_c.studio blk 5 100 250 40 >> "non_sq-$out"
				./matmult_c.studio blk 100 5 250 40 >> "non_sq-$out"
				./matmult_c.studio blk 5 100 250 60 >> "non_sq-$out"
				./matmult_c.studio blk 100 5 250 60 >> "non_sq-$out"
				;;
			h )
				echo $usage
	       			exit 0
				;;
			\? )
				echo $usage
				exit 1
				;;
		esac
	done

exit 0
