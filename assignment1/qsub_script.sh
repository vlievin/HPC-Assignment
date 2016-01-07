#!/bin/sh

# embedded options to qsub - start with #PBS
# -- Name of the job ---
#PBS -N HPC_matrix_multipication
# -- specify queue --
#PBS -q hpc
# -- estimated wall clock time (execution time): hh:mm:ss --
#PBS -l walltime=01:00:00
# -- number of processors/cores/nodes (request 1 node with 20 cores) --
#PBS -l nodes=1:ppn=1
# -- user email address --
#PBS -M valentin.lievin@gmail.com
# -- mail notification when begins(b), ends(e) and fails (a=aborted) --
#PBS -m a
# -- run in the current working (submission) directory --

# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi

NPROCS=`wc -l < "${PBS_NODEFILE}"`
(
        echo == NPROCS: $NPROCS
        echo == PBS_NP: $PBS_NP
        echo == PBS_NODENUM: $PBS_NODENUM
        echo == PBS_NUM_NODES: $PBS_NUM_NODES
        echo == PBS_NUM_PPN: $PBS_NUM_PPN
        echo == PBS_TASKNUM: $PBS_TASKNUM

	# call one or multiple scripts
	./mm-multiplication.sh -o output_1.dat -1 -2

) > specs.txt

lscpu >> specs.txt

exit 0


