open_project -project {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master_fp/Top_Fabric_Master.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master.map} \
    -header {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master.hdr} \
    -envm {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master.efc}  \
    -spm {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master.spm} \
    -dca {/nfs/home/joel/Documents/orca_sf2/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master.dca}
export_single_stapl \
    -name {M2S010} \
    -file {/nfs/home/joel/Documents/orca_sf2/sf2plus//Top_Fabric_Master_M2S010.stp} \
    -secured
set_programming_file -name {M2S010} -no_file
save_project
close_project
