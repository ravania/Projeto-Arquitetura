`default_nettype none //Comando para desabilitar declaraÃ§Ã£o automÃ¡tica de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

/*Mux2x1_8bits MUXX(.sel (SW[17]),.i0(SW[7:0]), .i1 (SW[15:8]),.out(LEDR [7:0]));
endmodule

module Mux2x1_8bits (input sel,input [7:0]i0, i1,output reg [7:0] out);

always @* begin

	if(sel == 1)
		out = i1;
	else
		out = i0;

end
endmodule*/


//Sprint 2
/*
wire CLK_1, CLK_12;
wire [3:0]count;


Dec_Hexa dec01(.in(count), .out(HEX4));


Div_Freq # (.OLD_FREQ(50000000), .WANTED_FREQ(1)) div01 (.reset(KEY[0]), .oldCLK(CLOCK_50), .newCLK(CLK_1));
Div_Freq # (.OLD_FREQ(50000000), .WANTED_FREQ(12)) div12 (.reset(KEY[0]), .oldCLK(CLOCK_50), .newCLK(CLK_12));

Contador (.clk(CLK_1), .reset(CLOCK_1), .out(count));

endmodule*/

//Sprint 3
/*
 Registrador ( .clock(CLOCK_1), .enable(SW[17]), .reset(KEY[2]), .wd3(SW[7:0]), .ra1(SW[13:11]) ,.ra2(SW[10:8]), .wa3(SW[16:14]) ,.rd1(w_d0x0[7:0]) ,.rd2(w_d0x1[7:0]));
 assign LEDG[8] = ~CLOCK_1 ;
 Decodificador Decod1(.in(SW[3:0]), .out(HEX0));
 Decodificador Decod2(.in(SW[7:4]), .out(HEX1[0:6])); endmodule 
*/


//Sprint 4 
/*
wire [7:0] w_rd1, mux, w_rd2, w_rd1SrcA;

assign LEDG[8] = CLOCK_1;
assign mux = (~SW[17]) ? w_rd2 : 8'h07;
assign w_d1x1 = mux;
assign w_d0x0 = w_rd1SrcA;
assign w_d1x0 = w_rd2;

Registrador ( .clock(CLOCK_1), .enable(1'b1), .reset(KEY[3]), .wd3(SW[7:0]), .ra1(SW[13:11]) ,.ra2(3'h2), .wa3(SW[16:14]) ,.rd1(w_rd1SrcA) ,.rd2(w_rd2));

Decodificador Decod1(.in(SW[3:0]), .out(HEX0[0:6]));
Decodificador Decod2(.in(SW[7:4]), .out(HEX1[0:6])); 
 
ULA ULA1(.ScrA(w_rd1SrcA), .ScrB(mux),.ULAControl(SW[10:8]), .FlagZ(LEDG[0]),	.ULAResult(w_d0x4));*/

//SPRINT 5 
/*
wire [7:0] w_PCp4,w_rd1SrcA, w_rd2,w_SrcB,w_ULAResultWd3,w_PC;
wire [31:0] w_inst;
wire w_RegWrite,w_ULASrc;
wire [2:0] w_ULAControl;



assign w_d0x4=w_PC;

Decodificador Decod0(.in(w_inst[3:0]), .out(HEX0[0:6])); 
Decodificador Decod1(.in(w_inst[7:4]), .out(HEX1[0:6])); 
Decodificador Decod2(.in(w_inst[11:8]), .out(HEX2[0:6])); 
Decodificador Decod3(.in(w_inst[15:12]), .out(HEX3[0:6])); 
Decodificador Decod4(.in(w_inst[19:16]), .out(HEX4[0:6])); 
Decodificador Decod5(.in(w_inst[23:20]), .out(HEX5[0:6])); 
Decodificador Decod6(.in(w_inst[27:24]), .out(HEX6[0:6])); 
Decodificador Decod7(.in(w_inst[31:28]), .out(HEX7[0:6])); 



assign LEDR[1]=w_PC;

PC PC1 (.clk(CLOCK_1), .rst(KEY[2]), .PCin(w_PCp4), .PC(w_PC)); 

Instr_Mem Im (.A(w_PC), .RD(w_inst)); 

Adder (.In01(w_PC), .In02(3'h4), .out(w_PCp4)); 

Registrador ( .clock(CLOCK_1), .enable(w_RegWrite), .reset(KEY[2]), .wd3(w_ULAResultWd3), .ra1(w_inst[19:15]) ,.ra2(w_inst[24:20]), .wa3(w_inst[11:7]) ,.rd1(w_rd1SrcA) ,.rd2(w_rd2),
.regi0(w_d0x0), .regi1(w_d0x1), .regi2(w_d0x2), .regi3(w_d0x3), .regi4(w_d1x0), .regi5(w_d1x1), .regi6(w_d1x2), .regi7(w_d1x3));

Control_Unit unit1(.OP(w_inst[6:0]), .Funct3(w_inst[14:12]), .Funct7(w_inst[31:25]), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .RegWrite(w_RegWrite));

MUX mux01(.i0(w_rd2), .i1(w_inst[31:20]), .sel(w_ULASrc), .out(w_SrcB)); 

ULA ula1 (.ScrA(w_rd1SrcA), .ScrB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResultWd3), .FlagZ(LEDG[0])); 

endmodule*/

//SPRINT 6
/*

wire w_ULASrc, w_RegWrite, w_ImmSrc, w_ResultSrc, w_MemWrite;
wire CLOCK_1, w_res;
wire [2:0] w_ULAControl;
wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResult, w_Wd3, w_Imm, w_RData;
wire [31:0] w_inst;


assign w_d0x4 = w_PC;
assign LEDR[7:0] = {w_RegWrite, w_ImmSrc, w_ULASrc, w_ULAControl, w_MemWrite, w_ResultSrc};
assign LEDG[8] = CLOCK_1;

PC PC1 (.clk(CLOCK_1), .rst(KEY[2]), .PCin(w_PCp4), .PC(w_PC)); //vv

Adder (.In01(w_PC), .In02(3'h4), .out(w_PCp4)); //vv

Instr_Mem Im (.A(w_PC), .RD(w_inst)); //vv

Decodificador Decod0(.in(w_inst[3:0]), .out(HEX0[0:6])); 
Decodificador Decod1(.in(w_inst[7:4]), .out(HEX1[0:6])); 
Decodificador Decod2(.in(w_inst[11:8]), .out(HEX2[0:6])); 
Decodificador Decod3(.in(w_inst[15:12]), .out(HEX3[0:6])); 
Decodificador Decod4(.in(w_inst[19:16]), .out(HEX4[0:6])); 
Decodificador Decod5(.in(w_inst[23:20]), .out(HEX5[0:6])); 
Decodificador Decod6(.in(w_inst[27:24]), .out(HEX6[0:6])); 
Decodificador Decod7(.in(w_inst[31:28]), .out(HEX7[0:6])); //vv

//vv
Control_Unit unit1(.OP(w_inst[6:0]), .Funct3(w_inst[14:12]), .Funct7(w_inst[31:25]), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .RegWrite(w_RegWrite));

//vv
Registrador ( .clock(CLOCK_1), .enable(w_RegWrite), .reset(KEY[2]), .wd3(w_Wd3), .ra1(w_inst[19:15]) ,.ra2(w_inst[24:20]), .wa3(w_inst[11:7]) ,.rd1(w_rd1SrcA) ,.rd2(w_rd2),
.regi0(w_d0x0), .regi1(w_d0x1), .regi2(w_d0x2), .regi3(w_d0x3), .regi4(w_d1x0), .regi5(w_d1x1), .regi6(w_d1x2), .regi7(w_d1x3));

//MUXLmmSrc
MUX mux01(.i0(w_inst[31:20]), .i1(w_inst[31:25]), .sel(w_ImmSrc), .out(w_Imm)); 

//MUXULASrc
MUX mux02(.i0(w_rd2), .i1(w_Imm), .sel(w_ULASrc), .out(w_SrcB)); 

//MUXReSrc
MUX mux03(.i0(w_ULAResult), .i1(w_RData), .sel(w_ResultSrc), .out(w_Wd3)); 

//vv
ULA ula1 (.ScrA(w_rd1SrcA), .ScrB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResult), .FlagZ(LEDG[0])); 

//VV
DataMem Mem(.clk(CLOCK_1),.rst(KEY[2]),.WE(w_MemWrite),.A(w_ULAResult), .WD(w_rd2),.RD(w_RData));
endmodule*/

//SPRINT 7
/*

wire w_ULASrc, w_RegWrite, w_MemWrite, W_Branch, w_PCSrc,w_ResultSrc;
wire [1:0] w_ImmSrc;
wire [2:0] w_ULAControl;

wire w_Zero; 

wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_Wd3, w_Imm, w_RData;
wire [7:0] w_ImmPC, w_PCn;
wire [31:0] w_inst;



assign w_d0x4 = w_PC;

assign LEDR[9] = w_RegWrite;
assign LEDR[8:7] = w_ImmSrc;
assign LEDR[6] = w_ULASrc;
assign LEDR[5:3] = w_ULAControl;
assign LEDR[2] = w_MemWrite;
assign LEDR[1] = w_ResultSrc;
assign LEDR[0] = W_Branch;

assign LEDG[8] = CLOCK_1;

wire CLOCK_1;


PC PC1 (.clk(CLOCK_1), .rst(KEY[2]), .PCin(w_PCn),.PC(w_PC)); //vv

Adder Add1(.In01(w_PC), .In02(3'h4), .out(w_PCp4)); //vv

Adder Add2(.In01(w_Imm), .In02(w_PC), .out(w_ImmPC)); //vv

Instr_Mem Im (.A(w_PC), .RD(w_inst)); //vv

Decodificador Decod0(.in(w_inst[3:0]), .out(HEX0[0:6])); 
Decodificador Decod1(.in(w_inst[7:4]), .out(HEX1[0:6])); 
Decodificador Decod2(.in(w_inst[11:8]), .out(HEX2[0:6])); 
Decodificador Decod3(.in(w_inst[15:12]), .out(HEX3[0:6])); 
Decodificador Decod4(.in(w_inst[19:16]), .out(HEX4[0:6])); 
Decodificador Decod5(.in(w_inst[23:20]), .out(HEX5[0:6])); 
Decodificador Decod6(.in(w_inst[27:24]), .out(HEX6[0:6])); 
Decodificador Decod7(.in(w_inst[31:28]), .out(HEX7[0:6])); //vv

//vv
Control_Unit unit1(.OP(w_inst[6:0]), .Funct3(w_inst[14:12]), .Funct7(w_inst[31:25]), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .RegWrite(w_RegWrite),.ImmSrc(w_ImmSrc),.MemWrite(w_MemWrite),.ResultSrc(w_ResultSrc),.Branch(W_Branch));

//vv
Registrador ( .clock(CLOCK_1), .enable(w_RegWrite), .reset(KEY[2]), .wd3(w_Wd3), .ra1(w_inst[19:15]) ,.ra2(w_inst[24:20]), .wa3(w_inst[11:7]) ,.rd1(w_rd1SrcA) ,.rd2(w_rd2),
.regi0(w_d0x0), .regi1(w_d0x1), .regi2(w_d0x2), .regi3(w_d0x3), .regi4(w_d1x0), .regi5(w_d1x1), .regi6(w_d1x2), .regi7(w_d1x3));

//MUXLmmSrc

MUX4x1 mux01(.inA(w_inst[31:20]), .inB({w_inst[31:25], w_inst[11:7]}), .inC({ w_inst[7], w_inst[30:25], w_inst[11:8], 1'b0}), .sel(w_ImmSrc[1:0]), .OUT(w_Imm)); 
//MUXULASrc

MUX mux02(.i0(w_rd2), .i1(w_Imm), .sel(w_ULASrc), .out(w_SrcB)); 

//MUXReSrc
MUX mux03(.i0(w_ULAResultWd3), .i1(w_RData), .sel(w_ResultSrc), .out(w_Wd3)); 

//MUXReSrc
MUX mux04(.i0(w_PCp4), .i1(w_ImmPC), .sel(w_PCSrc), .out(w_PCn)); 
//vv
ULA ula1 (.ScrA(w_rd1SrcA), .ScrB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResultWd3), .FlagZ(w_Zero)); 

pand pa(.a(W_Branch),.b(w_Zero),.c(w_PCSrc));


//VV
DataMem Mem(.clk(CLOCK_1),.rst(KEY[2]),.WE(w_MemWrite),.A(w_ULAResultWd3), .WD(w_rd2),.RD(w_RData));


endmodule
*/

//SPRINT 8



wire w_ULASrc, w_RegWrite, w_MemWrite, W_Branch, w_PCSrc,w_ResultSrc;
wire [1:0] w_ImmSrc;
wire [2:0] w_ULAControl;

wire w_Zero; 

assign LEDG[8] = CLOCK_1;

wire [7:0] w_PCp4, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_Wd3, w_Imm, w_RData,w_DataOut,w_DataIn,w_RegData;
wire [7:0] w_ImmPC, w_PCn;
wire [31:0] w_inst;


assign w_d1x4 = w_DataOut;
assign w_DataIn = SW[7:0];


assign w_d0x4 = w_PC;

assign LEDR[9] = w_RegWrite;
assign LEDR[8:7] = w_ImmSrc;
assign LEDR[6] = w_ULASrc;
assign LEDR[5:3] = w_ULAControl;
assign LEDR[2] = w_MemWrite;
assign LEDR[1] = w_ResultSrc;
assign LEDR[0] = W_Branch;



wire CLOCK_1;



PC PC1 (.clk(CLOCK_1), .rst(KEY[2]), .PCin(w_PCn),.PC(w_PC)); //vv

Adder Add1(.In01(w_PC), .In02(3'h4), .out(w_PCp4)); //vv

Adder Add2(.In01(w_Imm), .In02(w_PC), .out(w_ImmPC)); //vv

Instr_Mem Im (.A(w_PC), .RD(w_inst)); //vv

Decodificador Decod0(.in(w_inst[3:0]), .out(HEX0[0:6])); 
Decodificador Decod1(.in(w_inst[7:4]), .out(HEX1[0:6])); 
Decodificador Decod2(.in(w_inst[11:8]), .out(HEX2[0:6])); 
Decodificador Decod3(.in(w_inst[15:12]), .out(HEX3[0:6])); 
Decodificador Decod4(.in(w_inst[19:16]), .out(HEX4[0:6])); 
Decodificador Decod5(.in(w_inst[23:20]), .out(HEX5[0:6])); 
Decodificador Decod6(.in(w_inst[27:24]), .out(HEX6[0:6])); 
Decodificador Decod7(.in(w_inst[31:28]), .out(HEX7[0:6])); //vv

//vv
Control_Unit unit1(.OP(w_inst[6:0]), .Funct3(w_inst[14:12]), .Funct7(w_inst[31:25]), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .RegWrite(w_RegWrite),.ImmSrc(w_ImmSrc),.MemWrite(w_MemWrite),.ResultSrc(w_ResultSrc),.Branch(W_Branch));

//vv
Registrador ( .clock(CLOCK_1), .enable(w_RegWrite), .reset(KEY[2]),.val(SW[0]), .wd3(w_Wd3), .ra1(w_inst[19:15]) ,.ra2(w_inst[24:20]), .wa3(w_inst[11:7]) ,.rd1(w_rd1SrcA) ,.rd2(w_rd2),
.regi0(w_d0x0), .regi1(w_d0x1), .regi2(w_d0x2), .regi3(w_d0x3), .regi4(w_d1x0), .regi5(w_d1x1), .regi6(w_d1x2), .regi7(w_d1x3));

//MUXLmmSrc

MUX4x1 mux01(.inA(w_inst[31:20]), .inB({w_inst[31:25], w_inst[11:7]}), .inC({ w_inst[7], w_inst[30:25], w_inst[11:8], 1'b0}), .sel(w_ImmSrc[1:0]), .OUT(w_Imm)); 
//MUXULASrc

MUX mux02(.i0(w_rd2), .i1(w_Imm), .sel(w_ULASrc), .out(w_SrcB)); 

//MUXReSrc
MUX mux03(.i0(w_ULAResultWd3), .i1(w_RegData), .sel(w_ResultSrc), .out(w_Wd3)); 

//MUXReSrc
MUX mux04(.i0(w_PCp4), .i1(w_ImmPC), .sel(w_PCSrc), .out(w_PCn)); 
//vv
ULA ula1 (.ScrA(w_rd1SrcA), .ScrB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResultWd3), .FlagZ(w_Zero)); 

pand pa(.a(W_Branch),.b(w_Zero),.c(w_PCSrc));


//VV
DataMem Mem(.clk(CLOCK_1),.rst(KEY[2]),.WE(w_MemWrite),.A(w_ULAResultWd3), .WD(w_rd2),.RD(w_RData));

//VV
ParallelOUT pOut (.EN(w_MemWrite), .clk(CLOCK_1), .rst(KEY[2]), .RegData(w_rd2), .Address(w_ULAResultWd3), .DataOUT(w_DataOut));

//VV
ParallelIN pIN(.Address(w_ULAResultWd3), .MemData(w_RData), .DataIN(w_DataIn), .RegData(w_RegData));


Div_Freq # (.OLD_FREQ(50000000), .WANTED_FREQ(10)) div01 (.reset(KEY[0]), .oldCLK(CLOCK_50), .newCLK(CLOCK_1));
endmodule
