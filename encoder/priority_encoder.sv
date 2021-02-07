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
    if(D0)      Q2Q1Q0 = 3'b000 ;
	else if(D1) Q2Q1Q0 = 3'b001 ;
	else if(D2) Q2Q1Q0 = 3'b010 ;
	else if(D3) Q2Q1Q0 = 3'b011 ;
	else if(D4) Q2Q1Q0 = 3'b100 ;
	else if(D5) Q2Q1Q0 = 3'b101 ;
	else if(D6) Q2Q1Q0 = 3'b110 ;
	else if(D7) Q2Q1Q0 = 3'b111 ;
    endcase	
end
endmodule