onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PADDR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PCLK
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PENABLE
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PRDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PREADY
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PRESETN
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PSEL
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PSLVERR
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PWDATA
add wave -noupdate -radix hexadecimal /testbench/debug_top_0/mem_apb_wrp_debug_0/PWRITE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 368
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
WaveRestoreZoom {20011984468 fs} {23445709892 fs}
