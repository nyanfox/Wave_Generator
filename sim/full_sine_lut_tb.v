
module full_sine_lut_tb();

 wire [11:0] o_data;
 reg clk;
 reg [11:0] i_add;

 full_sine_lut full (.i_clk(clk), .i_add(i_add), .o_data(o_data));

 always begin #5 clk = ~clk; end

 always @(posedge clk) begin
  i_add <= i_add + 1;
  $display("value = %h", o_data);
  $display("add = %h", i_add);
 
 end
 
 initial begin
    clk = 0;
	 i_add = 0;
    $monitor("%d", o_data);
 
 end

endmodule
