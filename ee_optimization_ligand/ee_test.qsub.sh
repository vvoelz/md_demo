#!/bin/sh
#PBS -l walltime=4:00:00
#PBS -N ee_optimization 
#PBS -q normal 
#PBS -l nodes=1:ppn=28
#PBS -m bae
#PBS -M tud67309@temple.edu
#PBS
cd $PBS_O_WORKDIR

bash ~/.bashrc
conda activate mdsim
module load gromacs/2020.3

# Next, simulation with a EE pre-production to learn some good initial bias weights
gmx grompp -f ee_test.mdp -c npt.gro -r em_solv_ions.gro -p ligand.top -o ee_test.tpr -v -maxwarn 2
gmx mdrun -v -s ee_test.tpr -c ee_test.gro -g ee_test.log -o ee_test.trr -x ee_test.xtc -dhdl ee_test.dhdl
 
