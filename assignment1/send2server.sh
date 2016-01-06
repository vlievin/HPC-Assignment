#!/bin/sh
# embedded options to qsub - start with #PBS
# -- Name of the job ---
#PBS -N test_HPC_val
# –- specify queue --
#PBS -q hpc
# -- estimated wall clock time (execution time): hh:mm:ss --
#PBS -l walltime=01:00:00
# –- number of processors/cores/nodes (request 1 node with 20 cores)--
#PBS -l nodes=1:ppn=1
# –- user email address --
#PBS -M valentin.lievin@gmail.com
# –- mail notification when begins(b), ends(e) and fails (a=aborted)–-
#PBS -m abe
# -- run in the current working (submission) directory --
if test X$PBS_ENVIRONMENT = XPBS_BATCH; then cd $PBS_O_WORKDIR; fi
# here follow the commands you want to execute

NPROCS=`wc -l < $PBS_NODEFILE`
(
	echo == NPROCS: $NPROCS  
	echo == PBS_NP: $PBS_NP 
	echo == PBS_NODENUM: $PBS_NODENUM 
	echo == PBS_NUM_NODES: $PBS_NUM_NODES 
	echo == PBS_NUM_PPN: $PBS_NUM_PPN 
	echo == PBS_TASKNUM: $PBS_TASKNUM 
	
	./matmult_c.studio mnk 10 10 10
	./matmult_c.studio mnk 100 100 100
	./matmult_c.studio mnk 1000 1000 1000
	./matmult_c.studio mnk 3000 3000 3000

	./matmult_c.studio mkn 10 10 10
	./matmult_c.studio mkn 100 100 100
	./matmult_c.studio mkn 1000 1000 1000
	./matmult_c.studio mkn 3000 3000 3000

	./matmult_c.studio knm 10 10 10
	./matmult_c.studio knm 100 100 100
	./matmult_c.studio knm 1000 1000 1000
	./matmult_c.studio knm 3000 3000 3000

 	./matmult_c.studio nmk 10 10 10
	./matmult_c.studio nmk 100 100 100
	./matmult_c.studio nmk 1000 1000 1000
	./matmult_c.studio nmk 3000 3000 3000

	./matmult_c.studio nkm 10 10 10
	./matmult_c.studio nkm 100 100 100
	./matmult_c.studio nkm 1000 1000 1000
	./matmult_c.studio nkm 3000 3000 3000

	./matmult_c.studio kmn 10 10 10
	./matmult_c.studio kmn 100 100 100
	./matmult_c.studio kmn 1000 1000 1000
	./matmult_c.studio kmn 3000 3000 3000	

) > output.txt

lscpu > specs.txt
