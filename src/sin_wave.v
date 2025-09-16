module sin_wave (i_clk, i_ftw, o_data);

 input i_clk;
 input [23:0] i_ftw;
 output [11:0] o_data;
 
 wire [23:0] phase1_o_data;

 
 full_sine_lut full1 (.i_clk(i_clk), .i_add(phase1_o_data[23:12]), .o_data(o_data));
 phase_accumulator phase1 (.i_clk(i_clk), .i_ftw(i_ftw), .o_data(phase1_o_data));


endmodule