/*
 * NYQ_TB.v
 * NYQ block testbench
 * Last modified by : Lois Lee
 * 
 * Last update: Oct 30, 2019
 */
 
`timescale 1ns / 1ps

module NYQ_TB();

 localparam CLK_PERIOD = 1.0; // Clock period in ns
 localparam IN_DELAY   = 0.2; // Delay after clock edge that testbench signals take to reach DUT pins 
 localparam OUT_DELAY  = 0.8; // Delay after clock edge that DUT outputs take to change
 localparam ADDR_WIDTH = 5;   // Number of bits for address
 localparam MEM_WIDTH = 32;   // Number of bits for memory words
 localparam IN_WIDTH = 24;    // Number of bits for module inputs
 localparam OUT_WIDTH = 24;   // Number of bits for module outputs

//  LOIS LOAD THE COEFF PARAMETERS
 
 localparam CLK_PERIOD_HALF = CLK_PERIOD/2; 
 
 integer fileIn;
 integer recIn;
 integer fileOut;
 integer recOut;
 integer error;
 
 /////////////////////
 //DUT instantiation  
 /////////////////////
 
 reg                   Clk_C;
 reg                   Rst_RB;
 reg                   WrEn_S;
 reg  [ADDR_WIDTH-1:0] Addr_D;
//  LOIS HERE THIS PARAM
 reg  [MEM_WIDTH-1:0]  PAR_In_D;
 reg  [IN_WIDTH-1:0]   NYQ_In_D;
 wire [OUT_WIDTH-1:0]  NYQ_Out_D;
 reg  [OUT_WIDTH-1:0]  NYQ_Out_DE;
 
 NYQ #(
   .ADDR_WIDTH( ADDR_WIDTH ),
   .MEM_WIDTH ( MEM_WIDTH  ),
   .IN_WIDTH  ( IN_WIDTH   ),
   .OUT_WIDTH ( OUT_WIDTH  )
 )
 DUT (
   .Clk_CI     ( Clk_C     ),
   .Rst_RBI    ( Rst_RB    ),
   .WrEn_SI    ( WrEn_S    ),
   .Addr_DI    ( Addr_D    ),
   .PAR_In_DI  ( PAR_In_D  ),
   .NYQ_In_DI  ( NYQ_In_D  ),
   .NYQ_Out_DO ( NYQ_Out_D )
 );
 
 //Clock generation
 initial begin
   Clk_C = 1'b1;
   forever
     #CLK_PERIOD_HALF Clk_C=~Clk_C;
 end

 //Stimuli application 
 initial begin
   //Wait for the input delay
   #(IN_DELAY) begin end 
   //Prepare stimuli file
   fileIn = $fopen("../tb/NYQ_in.txt","r");
   //Read file on a per cycle basis
   while(!$feof(fileIn)) begin
    // LOIS HERE WE WANT PAR_IN_D the params so no need to read in
    // recIn = $fscanf(fileIn, "%d %d %d %d %d\n", Rst_RB, WrEn_S, Addr_D, PAR_In_D, NYQ_In_DI);
     recIn = $fscanf(fileIn, "%d %d %d %d\n", Rst_RB, WrEn_S, Addr_D, NYQ_In_DI);
	 #CLK_PERIOD begin end
   end
   //Close file
   $fclose(fileIn);
 end
 
  //Output comparison
 initial begin
   //Initialize the error counter
   error = 0;
   //Wait for the output delay
   #(OUT_DELAY) begin end 
   //Prepare expected output file
   fileOut = $fopen("../tb/NYQ_out.txt","r");
   //Read file on a per cycle basis
   while(!$feof(fileOut)) begin
     recOut = $fscanf(fileOut, "%d\n", NYQ_Out_DE);
     //For each signal, we compare the expected output with the one obtained
     //NYQ_Out_DO
     if(&NYQ_Out_DE !== 1'bX) begin
       if(NYQ_Out_D !== NYQ_Out_DE) begin
         $display("[", $time, "] NYQ_Out_DO :: Value %d Expected %d",NYQ_Out_D, NYQ_Out_DE);
         error = error + 1;
       end
     end
     #CLK_PERIOD begin end
   end
   //Close file
   $fclose(fileOut);
   //Finish simulation
   if(error == 0) $display("<<< :D All outputs match the expected results! :D >>>");
   $finish;
 end

endmodule
