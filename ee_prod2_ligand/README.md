# SETUP

Make sure to put gromacs202.3 in your path

```
$ module load gromacs/2020.3
```

#
# cp ../ee_optimization_ligand/npt.gro ./
# cp ../ee_optimization_ligand/em_solv_ions.gro ./
# cp ../ee_optimization_ligand/LIG_pos1.itp ./
# cp ../ee_optimization_ligand/ligand.top ./

# I set the simulation time to 100 ns 
# optimized the bias weights using pylambdaopt

# Next, simulation with a EE pre-production to learn some good initial bias weights
gmx grompp -f ee_prod.mdp -c npt.gro -r em_solv_ions.gro -p ligand.top -o ee_prod.tpr -v -maxwarn 2
gmx mdrun -v -s ee_prod.tpr -c ee_prod.gro -g ee_prod.log -o ee_prod.trr -x ee_prod.xtc -dhdl ee_prod.dhdl

