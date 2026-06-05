### prepare
source ./pipeline_settings.tcl

set raw_pdb_file RAW_PDB
set prefix $prefix


mol load pdb ./${raw_pdb_file}.pdb
# handle water part
puts "Working on water part"
set water [atomselect top water]
$water writepdb ./${prefix}_0_water.pdb
# handle protein parts
puts "Working on protein part"
set protein [atomselect top protein]
set chains [lsort -unique [$protein get pfrag]]
foreach chain $chains {
set sel [atomselect top "pfrag $chain"]
$sel writepdb ./${prefix}_chain_${chain}.pdb
}
exit

