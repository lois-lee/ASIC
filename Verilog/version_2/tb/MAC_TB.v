`timescale 1ns / 1ps
module MAC_TB();

 localparam CLK_PERIOD = 1.0; // Clock period in ns
 localparam IN_DELAY   = 0.2; // Delay after clock edge that testbench signals take to reach DUT pins 
 localparam OUT_DELAY  = 0.8; // Delay after clock edge that DUT outputs take to change
 localparam WIDTH = 24;    // Number of bits for module inputs
  
 localparam CLK_PERIOD_HALF = CLK_PERIOD/2; 
 
 integer fileIn;
 integer recIn;
 integer fileOut;
 integer recOut;
 integer error;
 
 //instantiate DUT
 
 reg                   Clk_C;
 reg                   Rst_RB;
 reg                   WrEn_S;

 reg  [WIDTH-1:0]   In0_D;
 reg  [WIDTH-1:0]   In1_D;
 wire [WIDTH-1:0]   Out_DO;
 reg  [WIDTH-1:0]   Out_DOE;
 
 
 MAC #(
   .WIDTH( WIDTH )
 )
 DUT (
   .Clk_CI     ( Clk_C     ),
   .Rst_RBI    ( Rst_RB    ),
   .Clr_SI     ( Clr_SI    ),
   .WrEn_SI    ( WrEn_SI   ),
   .In0_DI 	   ( In0_DI  ),
   .In1_DI     ( In1_DI  ),
   .Out_DO     ( Out_DO )
 );

initial begin
   Clk_C = 1'b1;
   forever
     #CLK_PERIOD_HALF Clk_C=~Clk_C;
 end
 
 initial begin
   #(IN_DELAY) begin end 
   fileIn = $fopen("../tb/MAC_in.txt","r");
   while(!$feof(fileIn)) begin
    recIn = $fscanf(fileIn, "%d %d %d %d %d\n", Rst_RB, Clr_SI, WrEn_SI,In0_DI,In1_DI);    
	 #CLK_PERIOD begin end
   end
   $fclose(fileIn);
 end
 
 initial begin
   error = 0;
   #(OUT_DELAY) begin end 
   fileOut = $fopen("../tb/MAC_out.txt","r");
   while(!$feof(fileOut)) begin
     recOut = $fscanf(fileOut, "%d\n", Out_DOE);
     //For each signal, we compare the expected output with the one obtained
     //Out_DO
     if(&Out_DOE !== 1'bX) begin
       if(Out_DO !== Out_DOE) begin
         $display("[", $time, "] Out_DO :: Value %d Expected %d",Out_DO, Out_DOE);
         error = error + 1;
       end
     end
     #CLK_PERIOD begin end
   end
   //Close file
   $fclose(fileOut);
   //Finish simulation
   if(error == 0) $display("All outputs match expected");
   $finish;
 end

endmodule
