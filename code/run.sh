#!/bin/bash
# Generic submission helper.
# Edit the commands below to match your scheduler.

set -e

# SLURM example:
# first_job=$(sbatch --parsable 0_one_pdb.sh)
# sbatch --dependency=afterok:${first_job} 0_one_pdb_cont.sh

# PBS example:
# first_job=$(qsub 0_one_pdb.sh)
# qsub -W depend=afterok:${first_job} 0_one_pdb_cont.sh

echo "Edit run.sh for your scheduler before use."
