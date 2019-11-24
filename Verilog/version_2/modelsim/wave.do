onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /NYQ_TB/NYQ_In_D
add wave -noupdate /NYQ_TB/PAR_In_D
add wave -noupdate /NYQ_TB/NYQ_Out_D
add wave -noupdate /NYQ_TB/NYQ_Out_DE
add wave -noupdate /NYQ_TB/Clk_C
add wave -noupdate /NYQ_TB/Rst_RB
add wave -noupdate /NYQ_TB/WrEn_S
add wave -noupdate /NYQ_TB/Addr_D
add wave -noupdate /NYQ_TB/DUT/MAC_1/Out_DO
add wave -noupdate /NYQ_TB/DUT/MAC_1/In0_DI
add wave -noupdate -radix decimal /NYQ_TB/DUT/MAC_1/In1_DI
add wave -noupdate /NYQ_TB/DUT/MAC_1/WrEn_SI
add wave -noupdate /NYQ_TB/DUT/MAC_1/Clr_SI
add wave -noupdate /NYQ_TB/DUT/NYQ_Cnt_D
add wave -noupdate /NYQ_TB/DUT/MAC_2/Clk_CI
add wave -noupdate /NYQ_TB/DUT/MAC_2/Rst_RBI
add wave -noupdate /NYQ_TB/DUT/MAC_2/Clr_SI
add wave -noupdate /NYQ_TB/DUT/MAC_2/WrEn_SI
add wave -noupdate /NYQ_TB/DUT/MAC_2/In0_DI
add wave -noupdate /NYQ_TB/DUT/MAC_2/In1_DI
add wave -noupdate -radix decimal /NYQ_TB/DUT/MAC_2/Out_DO
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {192033168 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2252 ps}
