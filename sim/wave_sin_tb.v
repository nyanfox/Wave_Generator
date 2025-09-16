
module wave_sin_tb();

 wire [11:0] o_data;
 reg clk;
 reg [23:0] ftw;

 sin_wave sin1 (.i_clk(clk), .i_ftw(ftw), .o_data(o_data));

 always begin #5 clk = ~clk; end

 always @(posedge clk) begin
 
  $display("value = %h", o_data);
 
 end
 
 initial begin
    clk = 0;
	 ftw = 1;
    $monitor("%d", o_data);
 end

endmodule
