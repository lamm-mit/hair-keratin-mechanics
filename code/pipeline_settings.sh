#!/bin/bash
# Generic pipeline settings for MD/SMD workflows.
# Update these values for your local cluster and software environment.

# ---------- Input ----------
INPUT_PDB="example_structure.pdb"
INPUT_DIR="../datafile"
SYSTEM_PREFIX="SYSTEM"
CHAIN_INDEX=0

# ---------- Software ----------
VMD_COMMAND="vmd"
NAMD2_COMMAND="namd2"
NAMD3_COMMAND="namd3"
CATDCD_COMMAND="catdcd"
PYTHON_COMMAND="python3"

# Optional: uncomment and customize for your environment
# module purge
# module load gcc/XX.X.X
# module load cuda/XX.X
# module load namd/3
# conda activate your_env_name

# ---------- Runtime controls ----------
NUM_CPU=4
RUN_PREP=1
RUN_EQ=1
ANALYZE_EQ=1
RUN_SMD=1
ANALYZE_SMD=1
MAKE_MOVIE=0

# ---------- Directory layout ----------
CODE_PATH="0_codes"
WORK_PATH="1_working_dir"
RESULTS_PATH="2_results_dir"
MD_EQ_PATH="1_Equilibrate_system"
MD_SMD_PATH="2_Loading"
MOVIE_PATH="md_pict"
