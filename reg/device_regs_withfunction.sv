module device_regs_withfunction
#(parameter ADDRWIDTH=4,DATAWIDTH=8)	
(
input      [ADDRWIDTH-1:0] addr    ,
input                      wen     ,
input      [DATAWIDTH-1:0] wr_data ,
input                      ren     ,
output reg [DATAWIDTH-1:0] rd_data ,

input                     clk      ,
input                     rst
);

reg [DATAWIDTH-1:0] reg0,reg1,reg2,reg3 ;
reg [DATAWIDTH-1:0] rd_data_nxt         ;

function [DATAWIDTH-1:0] dev_reg_nxt;
    input [ADDRWIDTH-1:0] addr       ;
    input [ADDRWIDTH-1:0] reg_offset ;
    input                 wen        ;
    input [DATAWIDTH-1:0] wr_data    ;
    input [DATAWIDTH-1:0] dev_reg    ;
	    begin
		    dev_reg_nxt = ((addr==reg_offset)&&wen)?wr_data:dev_reg ;
	    end
endfunction

always@(posedge clk)begin
    if(rst)begin
	    reg0 <= 'b0 ;
	    reg1 <= 'b0 ;
	    reg2 <= 'b0 ;
	    reg3 <= 'b0 ;
	end
	else begin
	    reg0 <= dev_reg_nxt(addr,4'b0000,wen,wr_data,reg0) ;
	    reg1 <= dev_reg_nxt(addr,4'b0001,wen,wr_data,reg1) ;
	    reg2 <= dev_reg_nxt(addr,4'b0010,wen,wr_data,reg2) ;
	    reg3 <= dev_reg_nxt(addr,4'b0011,wen,wr_data,reg3) ;
	    rd_data <= rd_data_nxt ;
	end
end

always@(*)begin
    rd_data_nxt = rd_data ;
	if(ren)begin
	    case(1'b1)
		    (addr == 4'b0000): rd_data_nxt = reg0 ;
		    (addr == 4'b0001): rd_data_nxt = reg1 ;
		    (addr == 4'b0010): rd_data_nxt = reg2 ;
		    (addr == 4'b0011): rd_data_nxt = reg3 ;
		endcase
	end
end

endmodule
