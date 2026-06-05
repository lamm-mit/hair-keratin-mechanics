#!/bin/bash
#SBATCH --job-name="md_smd_pipeline"
#SBATCH --gres=gpu:1
#SBATCH --partition=<partition_name>
#SBATCH --constraint=<optional_constraint>
#SBATCH --mem=<memory>
#SBATCH -N <nodes>
#SBATCH --ntasks=<tasks>
#SBATCH --time=<hh:mm:ss>
#SBATCH --chdir=.
#SBATCH --output=cout.txt
#SBATCH --error=cerr.txt

set -euo pipefail
source ./pipeline_settings.sh

echo
echo "============================ Job information ============================"
date
echo "System prefix      : ${SYSTEM_PREFIX}"
echo "Input PDB          : ${INPUT_DIR}/${INPUT_PDB}"
echo "Working directory  : $(pwd)"
echo "========================================================================"
echo

file_name="${INPUT_PDB}"
pdb_path="${INPUT_DIR}/${file_name}"
this_pdb="temp.pdb"

mkdir -p "./${WORK_PATH}"
cd "${WORK_PATH}"

log_file="$PWD/run_monitor_cont.log"
echo "Beginning of a run..." > "$log_file"

if [[ ! -f "$pdb_path" ]]; then
    echo "Input file not found: $pdb_path" | tee -a "$log_file"
    exit 1
fi

if [[ ! -f "./RAW_PDB.pdb" ]]; then
    cp "$pdb_path" ./
    cp "$file_name" "$this_pdb"
    cp "$this_pdb" ./RAW_PDB.pdb
fi

cp ../pipeline_settings.tcl ./
cp ../${CODE_PATH}/*.tcl ./ 2>/dev/null || true
cp ../${CODE_PATH}/*.py ./ 2>/dev/null || true
cp ../${CODE_PATH}/*.dat ./ 2>/dev/null || true

if [[ 0 -eq 1 && $RUN_PREP -eq 1 ]]; then
    echo "Running PSF generation and alignment..." | tee -a "$log_file"
    $VMD_COMMAND -dispdev text -e ./1_build_psf_for_protein_chain.tcl
    $VMD_COMMAND -dispdev text -e ./2_rotate_and_position_one_chain_ImplicitWater.tcl
fi

mkdir -p "$MD_EQ_PATH" "$MD_SMD_PATH" ./collect_results "$MOVIE_PATH"

if [[ 0 -eq 1 && $RUN_EQ -eq 1 ]]; then
    echo "Populate and run equilibration stages manually or through your scheduler." | tee -a "$log_file"
    cp ../${CODE_PATH}/0_EneMin_NPT_withConstrain_S*.conf "$MD_EQ_PATH"/ 2>/dev/null || true
fi

if [[ $ANALYZE_EQ -eq 1 && -f "$MD_EQ_PATH/0_EneMin_NPT_withConstrain.log" ]]; then
    echo "Analyzing equilibration..." | tee -a "$log_file"
    (cd . && $VMD_COMMAND -dispdev text -e ./3_analyze_eq.tcl)
    $PYTHON_COMMAND ./plot_for_3.py || true
fi

if [[ $RUN_SMD -eq 1 ]]; then
    echo "Populate and run SMD stages manually or through your scheduler." | tee -a "$log_file"
    cp ../${CODE_PATH}/1_Tension_AlongX_S*.conf "$MD_SMD_PATH"/ 2>/dev/null || true
fi

if [[ $ANALYZE_SMD -eq 1 && -f "$MD_SMD_PATH/0_Tension_AlongX_np.log" ]]; then
    echo "Analyzing SMD..." | tee -a "$log_file"
    $VMD_COMMAND -dispdev text -e ./4_analyze_smd.tcl
    $PYTHON_COMMAND ./plot_for_6.py || true
fi

echo "Pipeline scaffold completed. Update scheduler/tool commands as needed." | tee -a "$log_file"
