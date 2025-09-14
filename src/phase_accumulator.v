module phase_accumulator (i_clk, o_data);

 input i_clk;
 output reg [11:0] o_data;
 
 reg [11:0] add = 0;
 
 always @(posedge i_clk) begin
 
     o_data <= add;
	  add <= add + 1;
 
 end

endmodule