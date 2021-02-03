//////////// while example(just testbench) /////////////
module while_tb;
parameter INIT_ADDR  = 32'h0000_0020 ,
          MAX_ADDR   = 32'h0000_003c ,
          ADDR_INCR  = 8'h04         ;
reg        clk      ;
reg [31:0] mem_addr ;
initial begin
    /*$fsdbDumpfile("top.fsdb");
    $fsdbDumpvars("+all");
    $fsdbDumpMDA();*/
    clk = 1;
    forever begin
    #1 clk = ~clk;
    end
end

initial begin
	  mem_addr = INIT_ADDR ;
    while(mem_addr <= MAX_ADDR)
    begin 
        @(posedge clk)
	//---do the task here
	//---end of task
        $display("memory address = %h",mem_addr);
	mem_addr = mem_addr +ADDR_INCR ;
end
#10 
$finish;
end
endmodule

	
/////////// for example(both testbench and rtl)///////
module while_tb;
reg [7:0] data_byte [0:7];
integer i;//for sv int also ok  
initial begin
/*$fsdbDumpfile("top.fsdb");
$fsdbDumpvars("+all");
$fsdbDumpMDA();*/
for(i=0;i<8;i=i+1)
    begin
        data_byte[i] = i;
        $display("data_byte is %h", data_byte[i]);
    end
end
endmodule
//////////// repeat testbench ///////////
module repeat_tb;
reg clk;
initial begin
    /*$fsdbDumpfile("top.fsdb");
    $fsdbDumpvars("+all");
    $fsdbDumpMDA();*/
    clk = 1;
    forever begin
    #1 clk = ~clk;
    end
end
initial begin
repeat(5) begin
    @(posedge clk)
    $display("time display",$time);
end
$finish;
end
endmodule
          
