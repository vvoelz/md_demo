import os, sys
from openff.toolkit import Molecule, Topology, ForceField
from openff.interchange import Interchange
from openff.units import unit
import numpy as np


# Helper function(s)

def run_cmd(cmd, testing=False):
    """Run a shell command on the UNIX command line.

    OPTIONS
    testing          If True, just print the cmd. Default: False
    """

    print('>>', cmd)
    if not testing:
        os.system(cmd)

#########################################
# Main

# From ChimeraX, we have PDB and mol2 pf hydrogenated (R)-donepezil: 
pdb_file = '../input_files/ligand_xtal_pose_addH.pdb'
mol2_file = '../input_files/ligand_xtal_pose_addH.mol2'

# First we need to convert the mol2 to *.sdf so OpenFF can read it!
sdf_file = 'ligand_xtal_pose_addH.sdf'
cmd = f'obabel -imol2 {mol2_file} -osdf -O{sdf_file}'
run_cmd(cmd)

# Create the OpenFF molecule
print('Creating an OpenFF molecule...')
with open(sdf_file, mode="rb") as file:
    mol = Molecule.from_file(file, file_format="SDF")
print(mol)

# Create the OpenFF Topology
print('Creating an OpenFF Topology...')
top = Topology.from_pdb('../input_files/ligand_xtal_pose_addH.pdb', unique_molecules=[mol])
print(top)

# Create the OpenFF Intercharge object
print('Loading in OpenFF Sage 2.0.0 Force Field...')
sage = ForceField("openff-2.0.0.offxml")
cubic_box = unit.Quantity(30 * np.eye(3), unit.angstrom)

print('Creating Interchange object...')
interchange = Interchange.from_smirnoff(topology=[mol], force_field=sage, box=cubic_box)
print(interchange)

# Write the topology in GROMACS format
grofile = "LIG.gro"
topfile = "LIG.top"
interchange.to_gro(grofile)
print(f'Wrote {grofile} .')
interchange.to_top(topfile)
print(f'Wrote {topfile} .')



