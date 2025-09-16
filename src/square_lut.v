module square_lut (i_clk, i_add, o_data);

 input i_clk;
 input i_add;
 output reg [11:0] o_data;
 
 
 reg [11:0] rom [0:1];
 
 initial begin 
     $readmemh("../data/square.hex", rom);
 end
 
 always @(posedge i_clk) begin
 
     o_data <= rom[i_add];
 
 end


endmodule