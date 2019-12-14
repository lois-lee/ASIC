###############################################################
#  Generated by:      Cadence Innovus 17.13-s098_1
#  OS:                Linux x86_64(Host ID vip-brg.ece.cornell.edu)
#  Generated on:      Fri Dec  6 23:17:17 2019
#  Design:            NYQ
#  Command:           saveDesign save/NYQ_cts.enc
###############################################################
current_design NYQ
create_clock [get_ports {Clk_CI}]  -name Clk_clk -period 320.000000 -waveform {0.000000 160.000000}
set_propagated_clock  [get_clocks {Clk_clk}]
set_clock_transition  -rise -min 0.2 [get_clocks {Clk_clk}]
set_clock_transition  -rise -max 0.2 [get_clocks {Clk_clk}]
set_clock_transition  -fall -min 0.2 [get_clocks {Clk_clk}]
set_clock_transition  -fall -max 0.2 [get_clocks {Clk_clk}]
set_propagated_clock  [get_ports {Clk_CI}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Clk_CI}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Clk_CI}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Clk_CI}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Clk_CI}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Rst_RBI}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Rst_RBI}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Rst_RBI}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Rst_RBI}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {WrEn_SI}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {WrEn_SI}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {WrEn_SI}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {WrEn_SI}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[0]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {Addr_DI[0]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {PAR_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[23]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[22]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[21]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[20]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[19]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[18]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[17]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[16]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[15]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[14]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[13]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[12]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[11]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[10]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[9]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[8]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[7]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[6]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[5]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[4]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[3]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[2]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[1]}]
set_driving_cell -lib_cell INVX4 -rise -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -min -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -rise -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[0]}]
set_driving_cell -lib_cell INVX4 -fall -max -pin ZN -from_pin INP -no_design_rule [get_ports {NYQ_In_DI[0]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[23]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[23]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[22]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[22]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[21]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[21]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[20]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[20]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[19]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[19]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[18]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[18]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[17]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[17]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[16]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[16]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[15]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[15]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[14]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[14]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[13]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[13]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[12]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[12]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[11]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[11]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[10]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[10]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[9]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[9]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[8]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[8]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[7]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[7]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[6]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[6]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[5]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[5]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[4]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[4]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[3]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[3]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[2]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[2]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[1]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[1]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Out_DO[0]}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Out_DO[0]}]
set_load -pin_load -max  0.01  [get_ports {NYQ_Valid_DO}]
set_load -pin_load -min  0.01  [get_ports {NYQ_Valid_DO}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[3]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[14]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[21]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[22]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[15]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[2]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[10]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[11]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[8]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[8]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[19]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[7]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[4]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[4]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[15]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[22]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[23]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[16]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[3]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[0]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[0]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[11]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[12]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[9]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[9]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[5]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[8]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[5]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[16]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[23]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[17]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[4]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[1]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[1]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[12]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[20]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[13]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[0]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[9]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[6]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[6]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[17]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[18]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[5]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[2]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {WrEn_SI}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[2]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[13]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[20]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[21]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[14]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[1]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Rst_RBI}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[10]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[7]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[10]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[7]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_In_DI[18]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[3]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {PAR_In_DI[19]}]
set_input_delay -add_delay 0.1 -clock [get_clocks {Clk_clk}] [get_ports {Addr_DI[6]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[1]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[10]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[19]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[8]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[17]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[6]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[15]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[22]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[4]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[13]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[20]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[2]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[11]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[0]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[9]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[18]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[7]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[16]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[23]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[5]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[14]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[21]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Valid_DO}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[3]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk_clk}] [get_ports {NYQ_Out_DO[12]}]
set_clock_uncertainty 0.02 -hold [get_clocks {Clk_clk}]
set_clock_uncertainty 0.01 -setup [get_clocks {Clk_clk}]
