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
ligand.top
ligand_only.gro 
LIG_pos1.itp
npt.gro
README.md
```

Let's take a look at the batch script `ee_prod2.qsub.sh` :
```
#!/bin/sh
#PBS -l walltime=24:00:00
#PBS -N ee_prod2_ligand
#PBS -q normal 
#PBS -l nodes=3:ppn=28
#PBS -m bae
#PBS -M tuxXXXXX@temple.edu
#PBS
cd $PBS_O_WORKDIR

module load gromacs/2020.3

# note --using npt.gro as starting structure since it's compatible with the lam_k=0 ensemble
gmx grompp -f ee_prod2.mdp -c npt.gro -r em_solv_ions.gro -p ligand.top -o ee_prod2.tpr -v -maxwarn 2
gmx mdrun -v -s ee_prod2.tpr -c ee_prod2.gro -g ee_prod2.log -o ee_prod2.trr -x ee_prod2.xtc -dhdl ee_prod2.dhdl
```

NOTES:
1. If you want the batch scheduler to email you the the beggining and end of the job, change `tuxXXXXX` to your AccessNetID.
2. This submits the simulation to *three* nodes of the "normal" queue, over 3 x 28 = 84 processors.
4. The job needs to be submitted from the `~/work/ee_prod2_ligand` directory.

Submit the job using:
```
qsub ee_prod2.qsub.sh
```
The job shouold take approximately 24 hours.



