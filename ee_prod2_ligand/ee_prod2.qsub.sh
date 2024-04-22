#!/bin/sh
#PBS -l walltime=36:00:00
#PBS -N ee_prod2_ligand
#PBS -q normal 
#PBS -l nodes=3:ppn=28
#PBS -m bae
#PBS -M tuxXXXXX@temple.edu
#PBS
cd $PBS_O_WORKDIR

module load gromacs/2020.3

# note --using npt.gro as starting structure since it's compatible with lam_k=0 ensemble
gmx grompp -f ee_prod2.mdp -c npt.gro -r em_solv_ions.gro -p ligand.top -o ee_prod2.tpr -v -maxwarn 2
gmx mdrun -v -maxh 35.95 -s ee_prod2.tpr -c ee_prod2.gro -g ee_prod2.log -o ee_prod2.trr -x ee_prod2.xtc -dhdl ee_prod2.dhdl

 
