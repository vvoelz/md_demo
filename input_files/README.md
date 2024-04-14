# File descriptions

## Receptor

* [4ey7.pdb](https://www.rcsb.org/structure/4EY7)  - Crystal Structure of Recombinant Human Acetylcholinesterase in Complex with Donepezil

* 4ey7_chainA.pdb - same, but chain B is deleted
* receptor_complete.pdb - receptor only, with missing residues and loops added with MODELLER in ChimeraX
* ligand_xtal_pose.pdb - ligand only, exported from ChimeraX, and extra PDB lines deleted.  NOTE: To read this molecule and build a Topology using OpenFF Toolkit, HETATM and CONECT lines *must* be contained in the PDB.

## Ligands

* Adeshina_2020_smiles.csv  - 23 inhibitors of human AChE with IC50 values from Adeshina et al 2020
* human_AChE_binders.csv    - known human AChE inhibitors with Kd/IC50 measurements and solved co-crystal structures 

# Information about human AChE inhibitors

### Donepezil
* PubChem: https://pubchem.ncbi.nlm.nih.gov/compound/Donepezil)
* PDB complex [4ey7.pdb](https://www.rcsb.org/structure/4EY7)
* Binding affinity: Kd estimate of 8.00 nM from Zhou et al. 2021

### huperzine A
* PubChem: https://pubchem.ncbi.nlm.nih.gov/compound/854026
* PDB complex: [4ey5.pdb](https://www.rcsb.org/structure/4EY5
* Binding affinity: Kd estimate of 17.0 nM from Zhou et al. 2021

### galantamine
* PubChem: https://pubchem.ncbi.nlm.nih.gov/compound/9651
* PDB complex: [4ey6.pdb](https://www.rcsb.org/structure/4EY6)
* Binding affinity: IC50 estimate of 2.01 $\pm$ 0.15 uM from Bolognesi 2007

### rivastigmine
  * PubChem: https://pubchem.ncbi.nlm.nih.gov/compound/77991
  * PDB complex: [1gqs](https://www.rcsb.org/structure/1GQS) - NOTE: in complex with Tetronarce (Torpedo) californica - Pacific sting ray AChE, not human! 
  * Binding affinity: IC50 estimate of 32.1 uM from Vicente-Zurdo et al. 2022


## References


Adeshina, Yusuf O., Eric J. Deeds, and John Karanicolas.
Machine Learning Classification Can Reduce False Positives in Structure-Based Virtual Screening. Proceedings of the National Academy of Sciences 117, no. 31 (August 4, 2020): 18477–88. https://doi.org/10.1073/pnas.2000585117.


Structures of human acetylcholinesterase in complex with pharmacologically important ligands.
Cheung, J., Rudolph, M.J., Burshteyn, F., Cassidy, M.S., Gary, E.N., Love, J., Franklin, M.C., Height, J.J.
(2012) J Med Chem 55: 10282-10286
DOI: https://doi.org/10.1021/jm300871x

Vicente-Zurdo, David, Noelia Rosales-Conrado, M. Eugenia León-González, Leonardo Brunetti, Luca Piemontese, A. Raquel Pereira-Santos, Sandra M. Cardoso, Yolanda Madrid, Sílvia Chaves, and M. Amélia Santos. “Novel Rivastigmine Derivatives as Promising Multi-Target Compounds for Potential Treatment of Alzheimer’s Disease.” Biomedicines 10, no. 7 (June 26, 2022): 1510. https://doi.org/10.3390/biomedicines10071510.

Zhou, Yu, Yan Fu, Wanchao Yin, Jian Li, Wei Wang, Fang Bai, Shengtao Xu, et al. “Kinetics-Driven Drug Design Strategy for Next-Generation Acetylcholinesterase Inhibitors to Clinical Candidate.” Journal of Medicinal Chemistry 64, no. 4 (February 25, 2021): 1844–55. https://doi.org/10.1021/acs.jmedchem.0c01863.

Bolognesi, Maria Laura, Rita Banzi, Manuela Bartolini, Andrea Cavalli, Andrea Tarozzi, Vincenza Andrisano, Anna Minarini, et al. “Novel Class of Quinone-Bearing Polyamines as Multi-Target-Directed Ligands To Combat Alzheimer’s Disease.” Journal of Medicinal Chemistry 50, no. 20 (October 1, 2007): 4882–97. https://doi.org/10.1021/jm070559a.




