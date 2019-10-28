/* ================================================================================
// NYQ: Nyquist filter block for ECE 5746 Applied Digital ASIC Design
// Author: Tomi Kalejaiye
// Date: 10/27/2019
// Project: SynTech
// ---- Description ---------------------------------------------------------------
// Please describe your block here:
// The Nyquist filter block applies a low pass filter to the incoming signal, and 
// sub-samples it.
// ---- Input/Output specifications -----------------------------------------------
// NYQ_In_DI	sample input 	[24bit]
// NYQ_Out_DO	sample output 	[24bit]
// ================================================================================ */


/* --------------------------------------------------------------------------------
// Module ports declaration 
// -------------------------------------------------------------------------------- */
module NYQ
#(
  // ---- The following parameters are the same for all blocks
  parameter ADDR_WIDTH = 5,  // number of entries in the parameter memory is equal to 2^(ADDR_WIDTH)
  parameter MEM_WIDTH = 32,  // word length of each memory entry to store parameters
  // ---- the following parameters are NYQ block specific (you can add or remove inputs and outputs)
  parameter FILT_WIDTH = 32, // width of full filter
  parameter COEFF_WIDTH = 32, // width of each coefficient
  parameter IN_WIDTH = 24,   // width of block inputs
  parameter OUT_WIDTH = 24   // width of block outputs
)
(
  // ---- The following signals are the same for all blocks (no touchy!)
  input                          Clk_CI,     // Clock signal
  input                          Rst_RBI,    // Asynchronous active low reset
  input                          WrEn_SI,    // Active high write enable
  input         [ADDR_WIDTH-1:0] Addr_DI,    // Address of the parameter in the memory
  input	        [MEM_WIDTH-1:0]  PAR_In_DI,  // Parameter input (written from external interface)

  // ---- The following signals are NYQ block specific.
  input         [IN_WIDTH-1:0]   NYQ_In_DI,  // Input to the block (block can read from other block's output states)
  output signed [OUT_WIDTH-1:0]  NYQ_Out_DO  // Output of the block (state). Use signed, whenever you are dealing with samples
);

/* --------------------------------------------------------------------------------
// Common parameters for all blocks (do not change)
// -------------------------------------------------------------------------------- */

localparam MEM_DEPTH = (1 << ADDR_WIDTH);   // You can have at most 2^ADD_WIDTH parameters per block
integer i;                                  // temporary variable
// ---- Defines block parameter memory that can be written from the outside of your module
// ---- Creates a register array (memory) to hold the parameter of the block
reg [MEM_WIDTH-1:0] parameter_memory [0:MEM_DEPTH-1];

/* --------------------------------------------------------------------------------
// Internal parameters and signals/variables declaration that are block specific
// Define the internal wires, regs and all other variables of your module
// -------------------------------------------------------------------------------- */


// ---- NYQ block specific wires and registers

reg [COEFF_WIDTH-1:0] NYQ_Filter_D [0:FILT_WIDTH-1];    // Filter stored in memory

NYQ_En_D;
NYQ_Clr_D;
NYQ_Cnt_D;


wire        [OUT_WIDTH-1:0]NYQ_MACOut_D1;    // Signal that holds output from MAC1 unit.
wire        [OUT_WIDTH-1:0]NYQ_MACOut_D2;    // Signal that holds output from MAC2 unit.
wire        [OUT_WIDTH-1:0]NYQ_MACOut_D3;    // Signal that holds output from MAC3 unit.
wire        [OUT_WIDTH-1:0]NYQ_MACOut_D4;    // Signal that holds output from MAC4 unit.

wire        [OUT_WIDTH-1:0] NYQ_Temp_D1;      // Signal that holds output from MAC2 + MAC1 unit.
wire        [OUT_WIDTH-1:0] NYQ_Temp_D2;      // Signal that holds output from MAC3 + MAC2 unit.
wire        [OUT_WIDTH-1:0] NYQ_Temp_D3;      // Signal that holds output from MAC4 + MAC3 unit.


/* --------------------------------------------------------------------------------
// Register Transfer Level (RTL) description of parameter memory (do not change)
// -------------------------------------------------------------------------------- */

// ---- Description of the parameter memory (same for all blocks)
always @(posedge Clk_CI or negedge Rst_RBI)
begin		                           // begin the memory control block
  if (!Rst_RBI) begin
    for (i = 0; i < MEM_DEPTH; i = i + 1)  // Reset all the parameters upon Rst_RBI being deasserted low
      parameter_memory[i] = 0;
  end else if (WrEn_SI) begin
    parameter_memory[Addr_DI] = PAR_In_DI; // Write parameter to memory if WrEn_SI is asserted high
  end
end                                        // end the memory control block

/* --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// Register Transfer Level (RTL) description of block specific code
// Here goes the actual RTL description of your own module
// --------------------------------------------------------------------------------
// -------------------------------------------------------------------------------- */


//Counter module
counter 
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI     ),
  .Cnt_Out_DO (NYQ_Cnt_D )  // Output of counter is connected to state register
);


// 1st MAC module
MAC #(
  .WIDTH ( OUT_WIDTH )
)
MAC_1
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI     ),
  .Clr_SI ( NYQ_Clr_D         ),
  .In0_DI ( NYQ_Filter_D[NYQ_Cnt_D] ), // Take the coefficient to be multiplied
  .In1_DI ( NYQ_In_DI            ), // Input signal
  .Out_DO ( NYQ_MACOut_D1              )  // Output of MAC is connected to state register
);

// 1st temp flip flop
FF #(
  .DATA_WIDTH ( OUT_WIDTH )
)
FF_1
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( NYQ_En_D        ),
  .D_DI    ( NYQ_MACOut_D1 ),
  .Q_DO    ( NYQ_Temp_D1   )
);


// 2nd MAC module
MAC #(
  .WIDTH ( OUT_WIDTH )
)
MAC_2
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI     ),
  .Clr_SI ( NYQ_Clr_D         ),
  .In0_DI ( NYQ_Filter_D[NYQ_Cnt_D + 8] ), // Take the coefficient to be multiplied
  .In1_DI ( NYQ_In_DI            ), // Input signal
  .Out_DO ( NYQ_MACOut_D2             )  // Output of MAC is connected to state register
);

// 2nd temp flip flop
FF #(
  .DATA_WIDTH ( OUT_WIDTH )
)
FF_2
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( NYQ_En_D        ),
  .D_DI    ( NYQ_MACOut_D2 + NYQ_Temp_D1 ),
  .Q_DO    ( NYQ_Temp_D2   )
);

// 3rd MAC module
MAC #(
  .WIDTH ( OUT_WIDTH )
)
MAC_3
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI     ),
  .Clr_SI ( NYQ_Clr_D         ),
  .In0_DI ( NYQ_Filter_D[NYQ_Cnt_D + 16] ), // Take the coefficient to be multiplied
  .In1_DI ( NYQ_In_DI            ), // Input signal
  .Out_DO ( NYQ_MACOut_D3              )  // Output of MAC is connected to state register
);

// 3rd temp flip flop
FF #(
  .DATA_WIDTH ( OUT_WIDTH )
)
FF_3
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( NYQ_En_D        ),
  .D_DI    ( NYQ_MACOut_D3 + NYQ_Temp_D2 ),
  .Q_DO    ( NYQ_Temp_D3   )
);


// 4th MAC module
MAC #(
  .WIDTH ( OUT_WIDTH )
)
MAC_4
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI     ),
  .Clr_SI ( NYQ_Clr_D         ),
  .In0_DI ( NYQ_Filter_D[NYQ_Cnt_D + 24] ), // Take the coefficient to be multiplied
  .In1_DI ( NYQ_In_DI            ), // Input signal
  .Out_DO ( NYQ_MACOut_D4              )  // Output of MAC is connected to state register
);

// 4th temp flip flop
FF #(
  .DATA_WIDTH ( OUT_WIDTH )
)
FF_4
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( NYQ_En_D        ),
  .D_DI    ( NYQ_MACOut_D4 + NYQ_Temp_D3 ),
  .Q_DO    ( NYQ_Out_DO   )
);


/* --------------------------------------------------------------------------------
// Done!
// -------------------------------------------------------------------------------- */

endmodule
