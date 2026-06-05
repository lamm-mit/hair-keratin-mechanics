# Generic shared Tcl settings for the MD/SMD pipeline.
# Update these values if you change naming conventions.

set system_prefix SYSTEM
set chain_index 0
set raw_pdb_file RAW_PDB

set aligned_pdb "${system_prefix}_chain_${chain_index}_after_psf_AlongX.pdb"
set aligned_ref "${system_prefix}_chain_${chain_index}_after_psf_AlongX.ref"
set structure_psf "${system_prefix}_chain_${chain_index}_after_psf.psf"
set structure_pdb "${system_prefix}_chain_${chain_index}_after_psf.pdb"
set eq_output_prefix "${system_prefix}_chain_${chain_index}_after_psf_AlongX_NPT"

# Topology / parameter files. Adjust these paths to match your installation.
set topology_file "../0_codes/top_all27_prot_lipid.inp"
set parameter_files [list     "../../0_codes/par_all27_prot_lipid.inp"     "../../0_codes/FF/par_all36m_prot.prm"     "../../0_codes/FF/par_all36_carb.prm"     "../../0_codes/FF/par_all36_lipid.prm"     "../../0_codes/FF/par_all36_na.prm"     "../../0_codes/FF/par_all36_cgenff.prm" ]
