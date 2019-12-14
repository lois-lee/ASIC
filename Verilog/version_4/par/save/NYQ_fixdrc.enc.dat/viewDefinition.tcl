if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name l_tc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/saed90nm_typ.lib]
create_library_set -name l_bc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/saed90nm_min.lib]
create_library_set -name l_wc\
   -timing\
    [list ${::IMEX::libVar}/mmmc/saed90nm_max.lib]
create_rc_corner -name rc_typical\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0
create_rc_corner -name rc_best\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 0
create_rc_corner -name rc_worst\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_delay_corner -name dc_min\
   -library_set l_bc\
   -rc_corner rc_best
update_delay_corner -name dc_min -power_domain PD_CORE\
   -library_set l_bc
create_delay_corner -name dc_max\
   -library_set l_wc\
   -rc_corner rc_worst
update_delay_corner -name dc_max -power_domain PD_CORE\
   -library_set l_wc
create_delay_corner -name dc_typ\
   -library_set l_tc\
   -rc_corner rc_typical
update_delay_corner -name dc_typ -power_domain PD_CORE\
   -library_set l_tc
create_constraint_mode -name test_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/test_mode/test_mode.sdc]
create_constraint_mode -name func_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/func_mode/func_mode.sdc]
create_constraint_mode -name hold_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/hold_mode/hold_mode.sdc]
create_analysis_view -name hold_tc -constraint_mode hold_mode -delay_corner dc_typ -latency_file ${::IMEX::dataVar}/mmmc/views/hold_tc/latency.sdc
create_analysis_view -name func_tc -constraint_mode func_mode -delay_corner dc_typ -latency_file ${::IMEX::dataVar}/mmmc/views/func_tc/latency.sdc
create_analysis_view -name hold_bc -constraint_mode hold_mode -delay_corner dc_min -latency_file ${::IMEX::dataVar}/mmmc/views/hold_bc/latency.sdc
create_analysis_view -name hold_wc -constraint_mode hold_mode -delay_corner dc_max -latency_file ${::IMEX::dataVar}/mmmc/views/hold_wc/latency.sdc
create_analysis_view -name test_wc -constraint_mode test_mode -delay_corner dc_max -latency_file ${::IMEX::dataVar}/mmmc/views/test_wc/latency.sdc
create_analysis_view -name func_wc -constraint_mode func_mode -delay_corner dc_max -latency_file ${::IMEX::dataVar}/mmmc/views/func_wc/latency.sdc
set_analysis_view -setup [list func_wc func_tc test_wc] -hold [list hold_bc hold_tc hold_wc]
catch {set_interactive_constraint_mode [list test_mode func_mode hold_mode] } 
