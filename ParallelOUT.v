
module ParallelOUT (input  EN, clk, rst,
						  input  [7:0] RegData, Address,
						  output  reg [7:0] DataOUT);
wire En;
assign En = (Address == 8'hFF) && EN;
	always @(posedge clk) begin
		
		if(!rst)
			DataOUT <= 8'h00;
		else if(En)
			DataOUT <= RegData; 
			
	end
endmodule

	
