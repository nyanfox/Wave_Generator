module sin_wave (i_clk, o_data);

 input i_clk;
 output [11:0] o_data;
 
 wire [11:0] phase1_o_data;
 
 
 full_sine_lut full1 (.i_clk(i_clk), .i_add(phase1_o_data), .o_data(o_data));
 phase_accumulator phase1 (.i_clk(i_clk),  .o_data(phase1_o_data));


endmodule