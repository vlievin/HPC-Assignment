#!/bin/sh

# embedded options to qsub - start with #PBS
# -- Name of the job ---
#PBS -N HPC_mnk
# -- specify queue --
#PBS -q hpc
# -- estimated wall clock time (execution time): hh:mm:ss --
#PBS -l walltime=01:00:00
# -- number of processors/cores/nodes (request 1 node with 20 cores) --
#PBS -l nodes=1:ppn=1
# -- user email address --
#PBS -M valentin.lievin@gmail.com
# -- mail notification when begins(b), ends(e) and fails (a=aborted) --
#PBS -m abe
# -- run in the current working (submission) directory --

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

MSIZE=( 10 100 )
METHOD=( mnk mkn nmk nkm kmn knm )

NPROCS=`wc -l < $PBS_NODEFILE`
(
	echo == NPROCS: $NPROCS
	echo == PBS_NP: $PBS_NP
	echo == PBS_NODENUM: $PBS_NODENUM
	echo == PBS_NUM_NODES: $PBS_NUM_NODES
	echo == PBS_NUM_PPN: $PBS_NUM_PPN
	echo == PBS_TASKNUM: $PBS_TASKNUM

	for i in ${METHOD[@]} ; do
		for j in ${MSIZE[@]} ; do
			./matmult_c.studio $i $j $j $j
		done
	done
) > output.dat

lscpu > specs.txt

exit 0
