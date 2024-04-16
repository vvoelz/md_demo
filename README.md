# md_demo
Demo for preparing and running molecular dynamics in GROMACS for a receptor ligand system: human acetylcholinesterase in complex with known inhibitors. 

## Requirements

For this demo, you will need:
* Anaconda Python ([conda](https://docs.anaconda.com/free/anaconda/install/) )
* GROMACS ([gromacs.org](https://www.gromacs.org))
* The Open Force Field Toolkit (https://github.com/openforcefield/openff-toolkit)  

### conda 

If you haven't already, install the latest version of the Anaconda Python distribution [conda](https://docs.conda.io/projects/conda/en/stable/), or [miniconda](https://docs.anaconda.com/free/miniconda/).

NOTE: The installation package is a large `*.sh` file (e.g. [https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh] ).  You can download this and install from your UNIX shell on Owlsnest, using:   
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh   # download the *.sh installer
bash Miniconda3-latest-Linux-x86_64.sh   # run the installer and follow the directions.  Answer 'yes' to all the questions!
```
#### Create and set up your conda environment 

The the created a conda enviroment called `vina` to prepare the receptor and ligands.  We will use this same enviroment for the gnina work here.

```
conda create --name mdsim
conda activate mdsim
```

And install the following packages:
* openbabel
* pandas
* openff-toolkit

```
conda install -c conda-forge openbabel pandas --yes
conda install -c conda-forge openff-toolkit
conda install --yes -c conda-forge "openff-forcefields >=2.0.0"
```

### GROMACS

On Owlsnest, GROMACS 2020.3 is already installed, and you can load in into your path using
```
module load gromacs/2020.3
```

##  Next Steps

NOTE: For each of these steps, make sure to read the _contents_ of each script before you run the script.  This way, you will know what is going on, and can debug if something goes wrong.

### Preparation

1. Run `./download_gnina` to get an executable copy of gnina.
2. Prepare the receptor using `python prepare_receptor.py`
3. Prepare the ligands using `python prepare_ligands.py`

### Docking

**IMPORTANT**! These steps should be run interactively on one of the nodes of Owlsnest, see below!

4. For the "smina" and "gnina_rescore" protocols, dock the ligands using `python docking.py` (use `qsub -I -q normal` )
5. For the "gnina_refinement" protocols, dock the ligands using `python docking_gpu.py` (use `qsub -I -q large` )


### Analysis

6. Run `./runme_before_analysis`.  This will:
   * install rdkit
   * make a PDB for the donepezil xtal pose ("input_files/donepezil_xtal.pdb")
   * install a tool called [DockRMSD](https://zhanggroup.org/DockRMSD/) so we can compute RMSD-to-xtal for molecules with symmetry or permuted atom orders.
7. Analyze the docking scores (and docking score vs. RMSD-to-xtal for donepezil) using `python analysis.py`.  This script will:
   * parse all the output sdf files to get the docking scores 
   * calculate RMSD-to-xtal for donepezil
   * print and save to csv format tables with the results (e.g. "docking_results/gnina_rescore_huperzine.csv")
8. You should visualize the docking results in ChimeraX (`scp` the `receptor.pdbqt` and the `scp -r` the entire `docking_results` folder files to your personal computer)
9. I have provided a jupyter notebook with some example code to plot the results: [plot_results.ipynb](plot_results.ipynb)

### Running interactively on Owlsnest

Running any program that requires substantial computational resources is NOT ALLOWED on Owlsnest.  This applies to our docking calculations as well. Since we're only docking ligands, the overall runtime should be short.  In this case, we can submit an interactive job on the `normal` queue, using

```
qsub -I -q normal
```

This command will submit a queued shell job, and allow you to interact within it for up to 30 minutes (the docking should take less than a minute).  When you are logged into the node, you will be back in your $HOME directory, and in your base conda environment. You will need to change back to your working directory and activate your 'vina' conda environment like so:

```
cd ~/work/git/vina_demo   # or wherever your work is
conda activate vina
```

You now can continue to run scripts on the command line.  The jobs will run on the queued node, not the login node. 

To exit the interactive job, use
```
exit
```






