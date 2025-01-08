#!/bin/sh
#PBS -l walltime=36:00:00
#PBS -N ee_prod22_complex
#PBS -q normal 
#PBS -l nodes=3:ppn=28
#PBS -m bae
#PBS
cd /gpfs/work/tun50867/git/md_demo/ee_prod2_complex_1overt

#module load gromacs/2020.3

# note --using ee_test.gro as starting structure since it's compatible with lam_k=0 ensemble
/home/tun50867/gromacs_install/bin/gmx grompp -f ee_prod2.mdp -c npt.gro -r complex_solvated_ions.gro -p complex.top -o ee_0.tpr -v -maxwarn 2
/home/tun50867/gromacs_install/bin/gmx mdrun -v -s ee_0.tpr -c ee_0.gro -g ee_0.log -o ee_0.trr -x ee_0.xtc -dhdl ee_0.dhdl 
 
