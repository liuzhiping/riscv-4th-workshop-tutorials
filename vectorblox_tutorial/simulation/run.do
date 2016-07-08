quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "/nfs/home/ryan/orca_new/sf2plus"
source "${PROJECT_DIR}/simulation/bfmtovec_compile.tcl";source "${PROJECT_DIR}/simulation/CM3_compile_bfm.tcl";

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "/nfs/opt/microsemi/Libero_v11.7//Libero/lib/modelsim/precompiled/vhdl/smartfusion2"
if {[file exists ../component/Actel/DirectCore/CoreAPB3/4.0.4/mti/user_vlog/COREAPB3_LIB/_info]} {
   echo "INFO: Simulation library ../component/Actel/DirectCore/CoreAPB3/4.0.4/mti/user_vlog/COREAPB3_LIB already exists"
} else {
   file delete -force ../component/Actel/DirectCore/CoreAPB3/4.0.4/mti/user_vlog/COREAPB3_LIB 
   vlib ../component/Actel/DirectCore/CoreAPB3/4.0.4/mti/user_vlog/COREAPB3_LIB
}
vmap COREAPB3_LIB "../component/Actel/DirectCore/CoreAPB3/4.0.4/mti/user_vlog/COREAPB3_LIB"
vmap COREAHBLITE_LIB "../component/Actel/DirectCore/CoreAHBLite/5.2.100/mti/user_vhdl/COREAHBLITE_LIB"
vcom -work COREAHBLITE_LIB -force_refresh
vlog -work COREAHBLITE_LIB -force_refresh
if {[file exists COREAHBTOAPB3_LIB/_info]} {
   echo "INFO: Simulation library COREAHBTOAPB3_LIB already exists"
} else {
   file delete -force COREAHBTOAPB3_LIB 
   vlib COREAHBTOAPB3_LIB
}
vmap COREAHBTOAPB3_LIB "COREAHBTOAPB3_LIB"
if {[file exists COREAHBLSRAM_LIB/_info]} {
   echo "INFO: Simulation library COREAHBLSRAM_LIB already exists"
} else {
   file delete -force COREAHBLSRAM_LIB 
   vlib COREAHBLSRAM_LIB
}
vmap COREAHBLSRAM_LIB "COREAHBLSRAM_LIB"
if {[file exists COREAXI_LIB/_info]} {
   echo "INFO: Simulation library COREAXI_LIB already exists"
} else {
   file delete -force COREAXI_LIB 
   vlib COREAXI_LIB
}
vmap COREAXI_LIB "COREAXI_LIB"
if {[file exists COREAXITOAHBL_LIB/_info]} {
   echo "INFO: Simulation library COREAXITOAHBL_LIB already exists"
} else {
   file delete -force COREAXITOAHBL_LIB 
   vlib COREAXITOAHBL_LIB
}
vmap COREAXITOAHBL_LIB "COREAXITOAHBL_LIB"
if {[file exists COREUARTAPB_LIB/_info]} {
   echo "INFO: Simulation library COREUARTAPB_LIB already exists"
} else {
   file delete -force COREUARTAPB_LIB 
   vlib COREUARTAPB_LIB
}
vmap COREUARTAPB_LIB "COREUARTAPB_LIB"
if {[file exists CORESPI_LIB/_info]} {
   echo "INFO: Simulation library CORESPI_LIB already exists"
} else {
   file delete -force CORESPI_LIB 
   vlib CORESPI_LIB
}
vmap CORESPI_LIB "CORESPI_LIB"

vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi_clockmux.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/corespi_pkg.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi_chanctrl.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi_control.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi_fifo.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi_rf.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/spi.vhd"
vcom -93 -explicit  -work CORESPI_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CORESPI/5.0.100/rtl/vhdl/core/corespi.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/Clock_gen.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/Rx_async.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/Tx_async.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/fifo_256x8_g4.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/coreuart_pkg.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/CoreUART.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/CoreUARTapb.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi_splitter.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi_to_apb.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/utils.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/components.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/top_util_pkg.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/fabric_master.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/i2s_decode.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/i2s_apb.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreResetP/7.0.104/rtl/vhdl/core/coreresetp_pcie_hotreset.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreResetP/7.0.104/rtl/vhdl/core/coreresetp.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CoreSF2Config/3.0.100/rtl/vhdl/core/coresf2config.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_addrdec.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_defaultslavesm.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_masterstage.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_slavearbiter.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_slavestage.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_matrix4x16.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite_pkg.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/coreahblite.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/coreahbtoapb3_ahbtoapbsm.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/coreahbtoapb3_apbaddrdata.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/coreahbtoapb3_penablescheduler.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/ahbtoapb3_pkg.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/coreahbtoapb3.vhd"
vcom -93 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3_muxptob3.vhd"
vcom -93 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3_iaddr_reg.vhd"
vcom -93 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/my_mss/CCC_0/my_mss_CCC_0_FCCC.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/my_mss/FABOSC_0/my_mss_FABOSC_0_OSC.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/my_mss_MSS/my_mss_MSS.vhd"
vcom -93 -explicit  -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.2.100/rtl/vhdl/core/components.vhd"
vcom -93 -explicit  -work COREAHBTOAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREAHBTOAPB3/3.1.100/rtl/vhdl/core/components.vhd"
vcom -93 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/components.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/my_mss/my_mss.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/my_mss_top/my_mss_top.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/apb_to_ram.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi_master.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/bram.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/iram.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/register_file.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/decode.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/alu.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/branch_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/load_store_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/sys_call.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/execute.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/instruction_fetch.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/orca.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/ram_mux.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi_wrapper.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/util_pkg.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/isa_pkg.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/architecture_pkg.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi4lite_sp_slave.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/axi_instr_slave.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/dma_engine_axi.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/dma_queue.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/component_pkg.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/dma_controller_axi.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/fifo_sync_behav.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/sdp_ram.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/fsl_handler.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/scratchpad_ram_xil.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/scratchpad.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/scratchpad_arbiter.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/adder_tree_clk.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/accum_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/dma_hazard_detect.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/instr_hazard_detect.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/wave_expander.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/masked_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/addr_gen.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/absv_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/arith_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/cmov_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/alu_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/shamt_roms.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/hardware_mult_behav.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/mul_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/exec_unit.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/barrel_shifter.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/size_up.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/in_shifter.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/size_down.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/out_shifter.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/vblox1_core.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/hdl/vectorblox_axi.vhd"
vcom -93 -explicit  -work COREUARTAPB_LIB "${PROJECT_DIR}/component/work/Top_Fabric_Master/CoreUARTapb_0/rtl/vhdl/core/components.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/work/Top_Fabric_Master/Top_Fabric_Master.vhd"
vcom -93 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/Simulation/RESET_GEN/1.0.1/RESET_GEN.vhd"
vcom -93 -explicit  -work presynth "/nfs/home/ryan/work_riscV/orca/sf2plus/component/work/testbench/testbench.vhd"

vsim -L SmartFusion2 -L presynth -L COREAPB3_LIB -L COREAHBLITE_LIB -L COREAHBTOAPB3_LIB -L COREAHBLSRAM_LIB -L COREAXI_LIB -L COREAXITOAHBL_LIB -L COREUARTAPB_LIB -L CORESPI_LIB  -t 1fs presynth.testbench
do "${PROJECT_DIR}/simulation/top_fabric_master_wave.do"
add log -r /*
run 100 us
