
module wave_sin_tb();

 wire [11:0] o_data;
 reg clk;


 sin_wave sin1 (.i_clk(clk), .o_data(o_data));

 always begin #5 clk = ~clk; end

 always @(posedge clk) begin
 
  $display("value = %h", o_data);
 
 end
 
 initial begin
    clk = 0;
    $monitor("%d", o_data);
    #20000 
	 $finish;  // chạy 20,000ns rồi dừng
 
 end

endmodule
