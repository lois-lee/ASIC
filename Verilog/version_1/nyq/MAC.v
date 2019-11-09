//When EN=1, out <= out+a*b
//When clear = 1, out <= clear_value

//Out width should be in1_width + in2_width + (1 for every addition)

module MAC
#(
  parameter WIDTH   // width of block outputs
)

(
  input Clk_CI, 
  input Rst_RBI, 
  input Clr_SI, 
  input WrEn_SI, 
  input signed [WIDTH/2-5:0]In0_DI, 
  input signed [WIDTH/2-5:0]In1_DI,
  output signed [WIDTH-1:0] Out_DO
);

wire signed [WIDTH/2-1:0]product_D; 
wire signed [WIDTH-1:0]sum_D;
wire signed [WIDTH-1:0] accumulate_D;

assign product_D = In0_DI * In1_DI;
assign sum_D = product_D + accumulate_D;


FF #(
    .DATA_WIDTH ( WIDTH )
)
FF_1
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( WrEn_SI        ),
  .D_DI    ( Clr_SI ? {WIDTH{1'b0}} : sum_D ),
  .Q_DO    ( accumulate_D   )
);

assign Out_DO = accumulate_D;

endmodule
