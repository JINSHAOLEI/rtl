//////////////////////////////////
//Name    : LRU                 //
//Author  : JSL                 //
//Function: Least Recently Used //
//////////////////////////////////
module matix_lru #(parameter SIZE = 8)
(
input  wire       clk              ;
input  wire       rst              ;
input  wire       update_the_entry ;
input  wire       update_index     ;
output reg  [2:0] lru_index        ;
);
reg [(SIZE-1):0] matrix     [0:(SIZE-1)] ;
   
generate
    genvar j,k;
	for(j=0;j<(SIZE);j=j+1)begin
	for(k=0;k<(SIZE);k=k+1)begin
	    always@(posedge clk)begin
		    if(rst)
			    matrix[j][k] <= 0'b0 ;
            else if(update_the_entry&&(j==update_index)&&(k!=update_index))
                matrix[j][k] <= 1'b1 ;
            else if(update_the_entry&&(j==update_index))	
                matrix[j][k] <= 1'b0 ;		
	    end
	end
	end
endgenerate

always@(posedge clk)begin
    if(rst)
	    lru_index <= 1'b0 ;
    else if(matrix[0]==8'd0)
	    lru_index <= 'd0 ;
	else if(matrix[1]==8'd0)
	    lru_index <= 'd1 ;
	else if(matrix[2]==8'd0)
	    lru_index <= 'd2 ;	
    else if(matrix[3]==8'd0)
	    lru_index <= 'd3 ;
	else if(matrix[4]==8'd0)
	    lru_index <= 'd4 ;
	else if(matrix[5]==8'd0)
	    lru_index <= 'd5 ;	
    else if(matrix[6]==8'd0)
	    lru_index <= 'd6 ;
	else if(matrix[7]==8'd0)
	    lru_index <= 'd7 ;
end

endmodule
