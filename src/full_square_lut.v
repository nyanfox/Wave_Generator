module full_square_lut (i_clk, i_add, o_data); //take 2 clock to output;

 input i_clk;
 input i_add;
 output [11:0] o_data;
 
 reg lut1_i_add;

 square_lut lut1 (.i_clk(i_clk), .i_add(lut1_i_add), .o_data(o_data));
 
 
 
 always @(posedge i_clk) begin
 
  if(i_add == 0) begin
      lut1_i_add <= 0;
  end
  
  else begin
      lut1_i_add <= 1;
  end
 
 end
 

endmodule