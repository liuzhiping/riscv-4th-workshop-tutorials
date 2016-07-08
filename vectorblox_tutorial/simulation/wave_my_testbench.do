onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/NSYSRESET
add wave -noupdate /testbench/Top_0/eNVM_prj0_0/MSS_RESET_N_F2M
add wave -noupdate /testbench/Top_0/eNVM_prj0_0/MSS_RESET_N_M2F
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/DATAOUT
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/Data_size
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HCLK
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HREADY
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HBURST
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HPROT
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HSIZE
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HSIZE_int
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HTRANS
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HRESETn
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HWRITE
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HWDATA
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HRDATA
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/HRESP
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/NVM_ADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/RAM_ADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/START
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/ahb_busy
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/ahb_fsm_current_state
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/RESP_err
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/init_done
add wave -noupdate -radix hexadecimal /testbench/Top_0/AHBMASTER_FIC_0/ram_init_done
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/INT_OUT
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PRESETN
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PCLK
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PSEL
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PENABLE
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PWRITE
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PWDATA
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PRDATA
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PSLVERR
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/PREADY
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SEL
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/raddr_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/rclk_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/rd_enable_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/rdata_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/waddr_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/wclk_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/wdata_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/wr_enable_user
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/ARST_N
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WCLK
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WEN
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WD
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RADDR
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RCLK
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RD
add wave -noupdate -radix hexadecimal /testbench/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/REN
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40314919964 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 374
configure wave -valuecolwidth 87
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {46343823316 fs} {46879266395 fs}
