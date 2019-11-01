/* ================================================================================
// 2-input MUX
// Author: Seyed Hadi Mirfarshbafan
// Date: 10/22/2019
// Project: SynTech
// ---- Description ---------------------------------------------------------------
// Multibit 2-input multiplexer (MUX) template
// ---- Input/Output specifications -----------------------------------------------
// In0_DI		0th input data signal
// In1_DI		1st input data signal
// Sel_SI  		select bit (0 picks In0, 1 picks In1)
// Out_DO		Output data signal
// ================================================================================ */

module MUX2
#(
  parameter WIDTH = 16
)
(
  input  [WIDTH-1:0] In0_DI,
  input  [WIDTH-1:0] In1_DI,
  input              Sel_SI,
  output [WIDTH-1:0] Out_DO
);

  assign Out_DO = Sel_SI ? In1_DI: In0_DI;

endmodule
