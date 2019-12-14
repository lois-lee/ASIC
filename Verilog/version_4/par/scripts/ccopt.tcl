###############################################################
#  Generated by:      Cadence Innovus 17.13-s098_1
#  OS:                Linux x86_64(Host ID vip-brg.ece.cornell.edu)
#  Generated on:      Fri Dec  6 23:08:08 2019
#  Design:            NYQ
#  Command:           create_ccopt_clock_tree_spec -file scripts/ccopt.tcl
###############################################################
#-------------------------------------------------------------------------------
# Clock tree setup script - dialect: Innovus
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

namespace eval ::ccopt {}
namespace eval ::ccopt::ilm {}
set ::ccopt::ilm::ccoptSpecRestoreData {}
# Start by checking for unflattened ILMs.
# Will flatten if so and then check the db sync.
if { [catch {ccopt_check_and_flatten_ilms_no_restore}] } {
  return -code error
}
# cache the value of the restore command output by the ILM flattening code
set ::ccopt::ilm::ccoptSpecRestoreData $::ccopt::ilm::ccoptRestoreILMState

# Clocks present at pin Clk_CI
#   Clk_clk (period 80.000ns) in timing_config func_mode([src/constraints/constraints_mode0.sdc src/constraints/latencies_mode0_postcts.sdc])
#   Clk_clk (period 320.000ns) in timing_config test_mode([src/constraints/constraints_modeT.sdc src/constraints/latencies_mode0_postcts.sdc])
#   Clk_clk (period 80.000ns) in timing_config hold_mode([src/constraints/constraints_modeH.sdc src/constraints/latencies_mode0_postcts.sdc])
create_ccopt_clock_tree -name Clk_clk -source Clk_CI -no_skew_group
set_ccopt_property target_max_trans_sdc -delay_corner dc_max -early -clock_tree Clk_clk 0.200

set_ccopt_property target_max_trans_sdc -delay_corner dc_max -late -clock_tree Clk_clk 0.200

set_ccopt_property target_max_trans_sdc -delay_corner dc_typ -early -clock_tree Clk_clk 0.200

set_ccopt_property target_max_trans_sdc -delay_corner dc_typ -late -clock_tree Clk_clk 0.200
set_ccopt_property source_driver -clock_tree Clk_clk {INVX4/INP INVX4/ZN}
# Clock period setting for source pin of Clk_clk
set_ccopt_property clock_period -pin Clk_CI 80

# Skew group to balance non generated clock:Clk_clk in timing_config:func_mode (sdc src/constraints/constraints_mode0.sdc src/constraints/latencies_mode0_postcts.sdc)
create_ccopt_skew_group -name Clk_clk/func_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/func_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/func_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/func_mode func_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/func_mode {dc_max dc_typ}

# Skew group to balance non generated clock:Clk_clk in timing_config:test_mode (sdc src/constraints/constraints_modeT.sdc src/constraints/latencies_mode0_postcts.sdc)
create_ccopt_skew_group -name Clk_clk/test_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/test_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/test_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/test_mode test_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/test_mode dc_max

# Skew group to balance non generated clock:Clk_clk in timing_config:hold_mode (sdc src/constraints/constraints_modeH.sdc src/constraints/latencies_mode0_postcts.sdc)
create_ccopt_skew_group -name Clk_clk/hold_mode -sources Clk_CI -auto_sinks
set_ccopt_property include_source_latency -skew_group Clk_clk/hold_mode true
set_ccopt_property extracted_from_clock_name -skew_group Clk_clk/hold_mode Clk_clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group Clk_clk/hold_mode hold_mode
set_ccopt_property extracted_from_delay_corners -skew_group Clk_clk/hold_mode {dc_min dc_typ dc_max}


check_ccopt_clock_tree_convergence
# Restore the ILM status if possible
if { [get_ccopt_property auto_design_state_for_ilms] == 0 } {
  if {$::ccopt::ilm::ccoptSpecRestoreData != {} } {
    eval $::ccopt::ilm::ccoptSpecRestoreData
  }
}

