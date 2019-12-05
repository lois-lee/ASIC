//When EN=1, out <= out+a*b
//When clear = 1, out <= clear_value

//Out width should be in1_width + in2_width + (1 for every addition)

module MAC
#(
  parameter WIDTH = 24  // width of block outputs
)

(
  input Clk_CI, 
  input Rst_RBI, 
  input Clr_SI, 
  input WrEn_SI, 
  input signed [WIDTH-1:0]In0_DI, 
  input signed [WIDTH-1:0]In1_DI,
  output signed [WIDTH-1:0] Out_DO
);

localparam PRODUCT_WIDTH = 2*WIDTH;
localparam SUM_WIDTH = PRODUCT_WIDTH;

wire signed [PRODUCT_WIDTH-1:0]product_D; 
wire signed [SUM_WIDTH-1:0]sum_D;
wire signed [SUM_WIDTH-1:0] accumulate_D;

assign product_D = In0_DI * In1_DI;
assign sum_D = product_D + (Clr_SI ? {SUM_WIDTH{1'b0}} : accumulate_D);


FF #(
    .DATA_WIDTH ( SUM_WIDTH )
)
FF_1
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( WrEn_SI        ),
  .D_DI    ( sum_D  ), //take 24 bits from width-2 (drop the MSB).
  .Q_DO    ( accumulate_D   )
);

assign Out_DO = sum_D[SUM_WIDTH-2:(SUM_WIDTH-2)-(WIDTH-1)];

endmodule
