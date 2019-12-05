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
input                       WrEn_SI,

output reg [7:0] Cnt_Out_DO  // Counter value output
);

//—-Logic—-
always @(posedge Clk_CI or negedge Rst_RBI)
if (!Rst_RBI) begin
  Cnt_Out_DO <= 255;
end else if (WrEn_SI) begin
  Cnt_Out_DO <= Cnt_Out_DO - 1;
end

endmodule 
