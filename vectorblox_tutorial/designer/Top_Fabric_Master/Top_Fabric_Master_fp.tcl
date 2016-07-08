new_project \
         -name {Top_Fabric_Master} \
         -location {/nfs/home/joel/Documents/orca_sf2+/sf2plus/designer/Top_Fabric_Master/Top_Fabric_Master_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
