module DataMem #(parameter WIDTH = 256)(  input WE, rst, clk,
														input [7:0] A, WD,
													   output [7:0] RD );


reg [7:0] m_memoria [WIDTH-1:0];


//Escrita Combinacional

assign RD = m_memoria [A];


//Escrita Sequencial
		 
integer i;

always @(posedge clk) begin

	if (WE)	
		m_memoria [A] <= WD; 
	
	if (~rst) begin
		for(i = 0; i < 256; i=i+1) 
			m_memoria[i] = 7'b0000000;
	end
end


endmodule
