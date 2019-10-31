//When EN=1, out <= out+a*b
//When clear = 1, out <= clear_value

module MAC(EN, a, b, clear_value, clear, out, clk, rst_b);
	input a, b, EN, clear, clear_value, clk, rst_b;
	output out;
	reg [23:0] out;
	wire [23:0] a, b, clear_value;
	always@(posedge clk or negedge rst_b)
	if (!rst_b)
	out <= 0;
	else
	out <= clear ? clear_value : (EN ? out+a*b: out);
endmodule
