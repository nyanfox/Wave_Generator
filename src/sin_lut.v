module sin_lut (i_clk, i_add, o_data);

 input i_clk;
 input [9:0] i_add;
 output reg [11:0] o_data;
 
 
 reg [11:0] rom [0:1023];
 
 initial begin 
     $readmemh("../data/sine_1024.hex", rom);
 end
 
 always @(posedge i_clk) begin
 
     o_data <= rom[i_add];
 
 end


endmodule