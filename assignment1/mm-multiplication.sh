#!/bin/bash

MSIZE=( 10 100 500 1000 2000 3000 )
#MSIZE=( 10 100 )
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
				;;
			2 )
				for i in ${METHOD_2[@]} ; do
					for j in ${MSIZE[@]} ; do
						./matmult_c.studio $i $j $j $j >> $out
					done
				done
				;;
			3 )
				echo "ToDo BS"
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
