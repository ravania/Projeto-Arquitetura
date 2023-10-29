
module ParallelIN (input  [7:0] Address, MemData, DataIN,
						 output reg[7:0] RegData);

	always@(*) begin
		if(Address == 8'hFF)			
			RegData = DataIN;
		else 
		 RegData = MemData;
		
			
			
		
end	
endmodule
