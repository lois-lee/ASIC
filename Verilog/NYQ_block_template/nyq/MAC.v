//When EN=1, out <= out+a*b
//When clear = 1, out <= clear_value

module MAC
#(
  parameter WIDTH = 24   // width of block outputs
)

(
  input Clk_CI, Rst_RBI, Clr_SI, WrEn_SI, In0_DI, In1_DI,
  output Out_DO
);

FF #(
    .DATA_WIDTH ( WIDTH )
)
FF_1
(
  .Clk_CI  ( Clk_CI       ),
  .Rst_RBI ( Rst_RBI      ),
  .WrEn_SI ( WrEn_SI        ),
  .D_DI    ( Clr_SI ? 24'b0 : Out_D0 + (In0_D1*In1_D1) ),
  .Q_DO    ( Out_DO   )
);

endmodule
