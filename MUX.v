
module MUX (input [11:0] i0, i1, input sel, output reg [11:0]out);
	always @ (*) out = (sel)? i1 : i0;
endmodule 
