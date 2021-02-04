parameter REG0_OFFSET =4'b0000,
          REG1_OFFSET =4'b0001,
          REG2_OFFSET =4'b0010,
          REG3_OFFSET =4'b0011;

device_regs_withfunction #(.ADDRWIDTH(4),.DATAWIDTH(8))
reg_inst(
.clk(clk_tb)         ,
.rst(rst_tb)         ,
.addr(addr_tb)       ,
.wen(wen_tb)         ,
.wr_data(wr_data_tb) ,
.ren(ren_tb)         , 
.rd_data(rd_data_tb)
);
task reg_write;
    input [3:0] addr_in ;
    input [7:0] data_in ;
    begin
        @(posedge clk_tb);
            #1 addr_tb = addr_in ;
        @(posedge clk_tb);
            #1 wen_tb    = 1'b1    ;
               wr_data_tb = data_in ;
        @(posedge clk_tb)
            #1 wen_tb     = 1'b0 ;
               wr_data_tb = 0    ;
               addr_tb    = 4'hf ;
    end
endtask
task reg_read;
    input [3:0] addr_in       ;
    input [7:0] expected_data ;
    begin
        @(posedge clk_tb);
            #1 addr_tb = addr_in ;
        @(posedge clk_tb);
            #1 ren_tb    = 1'b1    ;
      
        @(posedge clk_tb);
            #1 ren_tb     = 1'b0 ;
               addr_tb    = 4'hf ;
        @(posedge clk_tb);
            if(expected_data==rd_data_tb)
                $display("match!expected_data is %h,rd_data is %h",expected_data,rd_data_tb);
            else
                $display("dismatch!expected_data is %h,rd_data is %h",expected_data,rd_data_tb);
    end
endtask

initial begin
    /*$fsdbDumpfile("top.fsdb");
    $fsdbDumpvars("+all");
    $fsdbDumpMDA();*/
    clk_tb = 1'b0;
    forever begin
        #HALF_CLK clk_tb = ~clk_tb;
    end
end


.ren(ren_tb)         , 
.rd_data(rd_data_tb)
);
task reg_write;
    input [3:0] addr_in ;
    input [7:0] data_in ;
    begin
        @(posedge clk_tb);
            #1 addr_tb = addr_in ;
        @(posedge clk_tb);
            #1 wen_tb    = 1'b1    ;
               wr_data_tb = data_in ;
        @(posedge clk_tb)
            #1 wen_tb     = 1'b0 ;
               wr_data_tb = 0    ;
               addr_tb    = 4'hf ;
    end
endtask
task reg_read;
    input [3:0] addr_in       ;
    input [7:0] expected_data ;
    begin
        @(posedge clk_tb);
            #1 addr_tb = addr_in ;
        @(posedge clk_tb);
            #1 ren_tb    = 1'b1    ;
      
        @(posedge clk_tb);
            #1 ren_tb     = 1'b0 ;
               addr_tb    = 4'hf ;
        @(posedge clk_tb);
            if(expected_data==rd_data_tb)
                $display("match!expected_data is %h,rd_data is %h",expected_data,rd_data_tb);
            else
                $display("dismatch!expected_data is %h,rd_data is %h",expected_data,rd_data_tb);
    end
endtask

initial begin
    $fsdbDumpfile("top.fsdb");
    $fsdbDumpvars("+all");
    $fsdbDumpMDA();
    clk_tb = 1'b0;
    forever begin
        #HALF_CLK clk_tb = ~clk_tb;
    end
end

initial begin
    rst_tb =1.1 ;
    addr_tb    = 0 ;
    wen_tb     = 0 ;
    wr_data_tb = 0 ;
    ren_tb     = 0 ;
    #10
    rst_tb = 0 ; 
end

initial begin
    #10.1
    reg_write (REG0_OFFSET,8'ha5);
    reg_read  (REG0_OFFSET,8'ha5);
    reg_write (REG1_OFFSET,8'ha6);
    reg_read  (REG1_OFFSET,8'ha6);
    reg_write (REG2_OFFSET,8'ha7);
    reg_read  (REG2_OFFSET,8'ha7);
    reg_write (REG3_OFFSET,8'ha8);
    reg_read  (REG3_OFFSET,8'ha8);
$finish;
end
endmodule
