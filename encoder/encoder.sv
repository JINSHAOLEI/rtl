module encoder
(
wire input D0,
wire input D1,
wire input D2,
wire input D3,
wire input D4,
wire input D5,
wire input D6,
wire input D7,
reg  output Q2Q1Q0);
always@(*)begin
    Q2Q1Q0 = 3'b000 ;
    case(1'b1)
    D0: Q2Q1Q0 = 3'b000 ;
	D1: Q2Q1Q0 = 3'b001 ;
	D2: Q2Q1Q0 = 3'b010 ;
	D3: Q2Q1Q0 = 3'b011 ;
	D4: Q2Q1Q0 = 3'b100 ;
	D5: Q2Q1Q0 = 3'b101 ;
	D6: Q2Q1Q0 = 3'b110 ;
	D7: Q2Q1Q0 = 3'b111 ;
    endcase	
end
endmodule
