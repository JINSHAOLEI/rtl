//////// 1: for////////
module gray_to_binary #(parameter PTR = 6)
(
input  reg [PTR-1:0] gray_value,
output wire [PTR-1:0] binary_value
);
assign binary_value = gray_value ;
generate 
    genvar i ; //only in for loop
    for(i=0;i<(PTR);i=i+1)
    begin
        assign binary_value[i] = binary_value[i+1]^gray_value[i] ;
    end
endgenerate
endmodule
//////// 2: always /////////
generate
if(WIDTH<10)
    assign a = b ;
	/*always@(*)begin
	    a = b;
	end*/
else
    assign a = c ;
	/*always@(*)begin
	    a = c;
	end*/
endgenerate
//////// 3: intance////////
parameter NUM_OF_PORTS =16;
generate
     genvar n;
	 for(n=0;n<NUM_OF_PORTS;n=n+1)
	 begin:switch_port_inst
		switch_port swicth_port_u
		(.a(in1[n])  ,
		 .b(in2[n])  ,
		 .c(out1[n]) ,
		 .d(out2[n])
	    ); 
	 end
endgenerate
	 

