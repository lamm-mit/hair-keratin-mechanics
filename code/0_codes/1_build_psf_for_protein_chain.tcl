### prepare
source ./pipeline_settings.tcl

# set prefix $prefix
#
set chain $chain_index

package require psfgen


topology $topology_file
# topology ./top_all36_prot.rtf
# topology ./par_all27_prot_lipid.inp

pdbalias residue HIS HSE
pdbalias atom ILE CD1 CD

# segment U {pdb ./${prefix}_chain_${chain}.pdb}
# coordpdb ./${prefix}_chain_${chain}.pdb U
segment U {pdb ./RAW_PDB.pdb}
coordpdb ./RAW_PDB.pdb U
guesscoord


writepdb ./${prefix}_chain_${chain}_after_psf.pdb
writepsf ./${prefix}_chain_${chain}_after_psf.psf

exit
