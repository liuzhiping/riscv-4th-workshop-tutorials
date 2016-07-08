onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HADDR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HBURST
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HCLK
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HPROT
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HRDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HREADY
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HRESETn
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HRESP
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HSIZE
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HSIZE_int
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HTRANS
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HWDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/AHBMASTER_FIC_0/HWRITE
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RADDR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RCLK
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/REN
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WADDR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WCLK
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WD
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/WEN
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RD
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RD_1
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/RD_1_net_0
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/Top_0/RAM_with_wrapper_0/SRAM_64x8_0/GND_net
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PCLK
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PENABLE
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PSEL
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PRESETN
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PWRITE
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PADDR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PWDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PRDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PREADY
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PSLVERR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/rd_enable
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/wr_enable
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/wclk
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/rclk
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/raddr
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/waddr
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/mem_data_in
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/mem_data_out
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/INT_OUT
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/SEL
add wave -noupdate /testbench/debug_top_0/mem_apb_wrp_debug_0/fsm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 450
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {4143287889 fs} {40383245969 fs}
