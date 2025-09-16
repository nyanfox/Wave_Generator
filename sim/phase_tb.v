
module phase_tb();

 wire [23:0] o_data;
 reg clk;
 reg [23:0] ftw;

 phase_accumulator phase (.i_clk(clk), .i_ftw(ftw), .o_data(o_data));

 always begin #5 clk = ~clk; end

 always @(posedge clk) begin
 
  $display("value = %h", o_data);
 
 end
 
 initial begin
    clk = 0;
	 ftw = 10;
    $monitor("%d", o_data);
    #20000 
	 $finish;  // chạy 20,000ns rồi dừng
 
 end

endmodule
