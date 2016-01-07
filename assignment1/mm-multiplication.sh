#!/bin/bash

MSIZE=( 10 100 500 1000 2000 3000 )

# L1 cache is 64 kB
BSIZE=( 5 10 15 20 25 30 40 50 55 60 65 80 100 )
METHOD_1=( nat lib )
METHOD_2=( mnk mkn nmk nkm kmn knm )

out=output_undefined.dat

	usage="usage: ./send2server.sh -o output_file -1 [-2] [-3]"
	while getopts "o:123h" options; do
		case $options in
			o )
				echo "-o was triggered will write results to file: $OPTARG" >&2
				out=$OPTARG
				;;
			1 )
				for i in ${METHOD_1[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio $i $j $j $j >> $out
					done
				done

				# try non-square matrix
				./matmult_c.studio nat 5 100 500 >> $out
				./matmult_c.studio lib 5 100 500 >> $out
				./matmult_c.studio nat 100 5 500 >> $out
				./matmult_c.studio lib 100 5 500 >> $out
				;;
			2 )
				for i in ${METHOD_2[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio $i $j $j $j >> $out
					done
				done
				;;
			3 )
				for i in ${BSIZE[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio blk $j $j $j $i >> $out
					done
				done

				# try non-square matrix
				./matmult_c.studio blk 5 100 500 40 >> $out
				./matmult_c.studio blk 100 5 500 40 >> $out
				./matmult_c.studio blk 5 100 500 60 >> $out
				./matmult_c.studio blk 100 5 500 60 >> $out
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
