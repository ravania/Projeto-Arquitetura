module Instr_Mem(input  [7:0] A,
        output reg [31:0] RD);
  
 
  
  always @(*) begin
  case(A)
	
	/*8'h00: RD = 32'h0ab00093;
	8'h04: RD = 32'h00100523;
	8'h08: RD = 32'h00a00103;
	8'h0C: RD = 32'h002005a3;
	8'h10: RD = 32'h00b00183;
	8'h14: RD = 32'h00300623;
	8'h18: RD = 32'h00c00203;
	default:RD=0; 
	
	8'h00: RD = 32'h0ff00083;
	8'h04: RD = 32'h00100193;
	8'h08: RD = 32'h00000113;
	8'h0C: RD = 32'h0030f3b3;
	8'h10: RD = 32'h00338a63;
	8'h14: RD = 32'hfe208ae3;
	8'h18: RD = 32'hfe000ae3;
	8'h1C: RD= 
	8'h20: RD=
	8'h1C: RD= 	*/
	
	/*8'h00: RD =	32'h0ff00083;
	8'h04: RD = 32'h00100193;
	/*8'h08: RD = 32'h00000113;
	8'h0C: RD = 32'h0030f3b3;
	8'h10: RD = 32'h00338a63;
	8'h14: RD = 32'h00238263;
	8'h18: RD = 32'h00100313;
	8'h1C: RD = 32'h0e600fa3;
	8'h20: RD = 32'hfe0000e3;
	8'h24: RD = 32'h00000313;
	8'h28: RD = 32'h0e600fa3;
	8'h2C: RD = 32'hfc000ae3;
	*/
	
	//AUMENTO DO BANCO DE REGISTRADORES
	/*8'h00: RD =	32'h00200093;
	8'h04: RD = 32'h00500113;
	8'h08: RD = 32'h00300193;
	8'h0C: RD = 32'h00114433;
	8'h10: RD = 32'h003147b3;*/
	
	
	
//Novas Funcionalidades

		8'h00: RD =	32'h00200093;  // addi x1,x0,2 -> X1 =2
		8'h04: RD = 32'h00500113;  //addi x2,x0,5  -> X2 =5
		8'h08: RD = 32'h00300193; //addi x3,x0,3  -> X3 =3
		8'h0C: RD = 32'h00100213;  //addi x4,x0,1  -> X4 =1
		8'h10: RD = 32'h00114433;  //xor x8,x2,x1  -> X8 =7
		8'h14: RD = 32'h004094b3;  //sll x9,x1,x4  -> X9 =4
		8'h18: RD = 32'h0040d533;  //srl x10,x1,x4 -> X10 =1
		8'h1C: RD = 32'h00111593;  //slli x11,x2,1 ->X11= A
		8'h20: RD = 32'h00115613;  //srli x12,x2,1 ->X12= 02
		8'h24: RD = 32'h0ff17693; //andi x13,x2,0xFF ->X13=05
		8'h28: RD = 32'h0010e713; //ori  x14,x1,1   ->X14=03
		8'h2C: RD = 32'h00114793;  //xori x15,x2,1   ->X15=04

	
	/*8'h08: RD = 32'h00000113;
	8'h0C: RD = 32'h0030f3b3;
	8'h10: RD = 32'h00338a63;
	8'h14: RD = 32'h00238263;
	8'h18: RD = 32'h00100313;
	8'h1C: RD = 32'h0e600fa3;
	8'h20: RD = 32'hfe0000e3;
	8'h24: RD = 32'h00000313;
	8'h28: RD = 32'h0e600fa3;
	8'h2C: RD = 32'hfc000ae3;
	*/



	default: RD = 'h0;
	endcase
	end
	endmodule
	
