# Generic MD/SMD code package

This package is a cleaned, shareable version of the uploaded workflow with user-specific paths, file names, cluster names, and environment details removed.

## What was generalized
- hard-coded absolute paths to VMD, NAMD, catdcd, and Python
- dataset-specific input names such as `KRT35.pdb`
- cluster-specific scheduler values such as partition, constraint, time, node count, and memory
- project-specific structure prefix names such as `TestProt`

## Files to edit before use
1. `pipeline_settings.sh`
2. `pipeline_settings.tcl`
3. scheduler directives in `0_one_pdb.sh` and `0_one_pdb_cont.sh`
4. topology / parameter file paths referenced in `pipeline_settings.tcl`

## Notes
- The original workflow mixed scheduler styles and contained cluster-local executable paths. The cleaned package preserves the pipeline structure but leaves scheduler/software commands intentionally generic.
- Hidden macOS metadata files were removed.
