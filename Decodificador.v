// ajustes no decodificador module 
module Decodificador(input [3:0] in, output reg[0:6] out); 
always @* begin
 case (in)
 4'b0000 : out = 7'b 0000001; 
 4'b0001 : out = 7'b 1001111; 
 4'b0010 : out = 7'b 0010010; 
 4'b0011 : out = 7'b 0000110; 
 4'b0100 : out = 7'b 1001100;
 4'b0101 : out = 7'b 0100100; 
 4'b0110 : out = 7'b 0100000; 
 4'b0111 : out = 7'b 0001111; 
 4'b1000 : out = 7'b 0000000; 
 4'b1001 : out = 7'b 0000100; 
 4'b1010 : out = 7'b 0001000;
 4'b1011 : out = 7'b 1100000;
 4'b1100 : out = 7'b 0110001; 
 4'b1101 : out = 7'b 1000010; 
 4'b1110 : out = 7'b 0110000; 
 4'b1111 : out = 7'b 0111000; 
 
 default : out = 7'b 0000001;
 endcase
 end 
 endmodule 
