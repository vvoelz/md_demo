# INSTRUCTIONS

Move the `ee_prod2_ligand.zip` archive to Owlsnest, inside your working directory:

```
scp ee_prod2_ligand.zip [AccessNetID]@owlsnest.hpc.temple.edu:work/ee_prod2_ligand.zip
```

Log into Owlsnest:
```
ssh [AccessNetID]@owlsnest.hpc.temple.edu
```

Once you are logged on to Owlsnest, go to your working directory, unzip the archive, and go inside the resulting directory:
```
cd ~/work
unzip ee_prod2_ligand.zip
cd ee_prod2_ligand
```

The following files should be in the directory:
```
$ ls -1
ee_prod2.mdp
ee_prod2.qsub.sh
em_solv_ions.gro
junk.py
ligand.top
LIG_pos1.itp
npt.gro
README.md
```

Make sure to put gromacs2020.3 in your path
```
module load gromacs/2020.3
```


# I set the simulation time to 100 ns 
# optimized the bias weights using pylambdaopt

# Next, simulation with a EE pre-production to learn some good initial bias weights
gmx grompp -f ee_prod.mdp -c npt.gro -r em_solv_ions.gro -p ligand.top -o ee_prod.tpr -v -maxwarn 2
gmx mdrun -v -s ee_prod.tpr -c ee_prod.gro -g ee_prod.log -o ee_prod.trr -x ee_prod.xtc -dhdl ee_prod.dhdl

