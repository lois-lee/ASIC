/* ================================================================================
// Counter: Counter for NYQ Block
// Author: Tomi Kalejaiye
// Date: 10/25/2019
// Project: SynTech
// ---- Description ---------------------------------------------------------------
// A simple counter that goes from 0d to 7d then wraps around.
//
// ---- Input/Output specifications -----------------------------------------------
// Cnt_Out_DO	counter output [3bit]
// ================================================================================ */

module counter    (

input                       Clk_CI,  // Clock signal
input                       Rst_RBI, // Asynchronous active low reset

output reg [3:0] Cnt_Out_DO  // Counter value output
);

//—-Logic—-
always @(posedge Clk_CI)
if (Rst_RBI) begin
  Cnt_Out_DO <= 3'b111;
end else begin
  Cnt_Out_DO <= Cnt_Out_DO - 1;
end

endmodule 
