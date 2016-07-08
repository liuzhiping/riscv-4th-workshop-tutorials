set_device -fam SmartFusion2
read_edif  \
    -file {/nfs/home/joel/Documents/orca_sf2+/sf2plus/synthesis/Top_Fabric_Master.edn}
write_vhdl -file {/nfs/home/joel/Documents/orca_sf2+/sf2plus/synthesis/Top_Fabric_Master.vhd}
