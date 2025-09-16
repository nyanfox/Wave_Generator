module phase_accumulator (i_clk, i_ftw, o_data);

 input i_clk;
 input [23:0] i_ftw;
 output reg [23:0] o_data;
 
 reg [23:0] phase = 0;
 
 always @(posedge i_clk) begin
 
     o_data <= phase;
	  phase <= phase + i_ftw;
 
 end

endmodule