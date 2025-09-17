module full_saw_lut (i_clk, i_add, o_data); //take 2 clock to output;

 input i_clk;
 input [9:0] i_add;
 output [11:0] o_data;
 
 reg lut1_i_add;
 saw_lut lut1 (.i_clk(i_clk), .i_add(lut1_i_add), .o_data(o_data));
 
 
 always @(posedge i_clk) begin
 
  lut1_i_add <= i_add;
  
 end
 

endmodule