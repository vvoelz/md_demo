#!/bin/sh
#PBS -l walltime=36:00:00
#PBS -N ee_prod22_complex
#PBS -q normal 
#PBS -l nodes=3:ppn=28
#PBS -m bae
#PBS -M tuxXXXXX@temple.edu
#PBS
cd $PBS_O_WORKDIR

module load gromacs/2020.3

# note --using ee_test.gro as starting structure since it's compatible with lam_k=0 ensemble
gmx grompp -f ee_prod2.mdp -c ee_test.gro -r complex_solvated_ions.gro -p complex.top -o ee_prod2.tpr -v -maxwarn 2
gmx mdrun -v -s ee_prod2.tpr -c ee_prod2.gro -g ee_prod2.log -o ee_prod2.trr -x ee_prod2.xtc -dhdl ee_prod2.dhdl
 
