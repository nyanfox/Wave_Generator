module wave_generator (i_clk, i_ftw, i_start, i_reset, i_mode, o_data);

 input i_clk;
 input i_start;
 input i_reset;
 input [23:0] i_ftw;
 input [2:0] i_mode;
 output [11:0] o_data;
 
 reg [11:0] rg_o_data;
 reg [2:0] mode;
 reg [2:0] state;
 
 wire [23:0] phase_o_data;
 wire [11:0] sin_o_data;
 wire [11:0] square_o_data;
 wire [11:0] saw_o_data;
 wire [11:0] tri_o_data;
 wire [11:0] rng_o_data;
 
 localparam SINE = 3'b000;
 localparam SQUARE = 3'b001;
 localparam TRI = 3'b010;
 localparam SAW = 3'b011;
 localparam ECG = 3'b100;
 localparam NOISE = 3'b101;
 
 localparam IDLE = 3'b000;
 localparam CAL = 3'b001;
 
 phase_accumulator phase (.i_clk(i_clk), .i_ftw(i_ftw), .o_data(phase_o_data));
 
 full_sin_lut sin (.i_clk(i_clk), .i_add(phase_o_data[23:12]), .o_data(sin_o_data));
 full_square_lut square (.i_clk(i_clk), .i_add(phase_o_data[23]), .o_data(square_o_data));
 full_saw_lut saw (.i_clk(i_clk), .i_add(phase_o_data[23:14]), .o_data(saw_o_data));
 full_tri_lut trine (.i_clk(i_clk), .i_add(phase_o_data[23:14]), .o_data(tri_o_data));
 rng_lfsr_12bit rng (.i_clk(i_clk), .o_data(rng_o_data));
 
 assign o_data = rg_o_data;
 
 always @(posedge i_clk) begin
 
  if (i_reset == 0) begin
	   state <= IDLE;
  end
 
  else if (i_start == 1) begin
 
      state <= CAL;
  end
 
 end
 
 always @(posedge i_clk) begin
   case (state)
	 IDLE: begin
	    mode <= 3'b111; 
	 end
	 CAL: begin
	     mode <= i_mode;
	 end
   endcase
 end
 
 always @(posedge i_clk) begin
  case (mode)
   SINE: begin
       rg_o_data <= sin_o_data;
	end
	SQUARE: begin
	    rg_o_data <= square_o_data;    
	end
	TRI: begin
	    rg_o_data <= tri_o_data;    
	end
	SAW: begin
	    rg_o_data <= saw_o_data; 
	end
	NOISE:begin
	    rg_o_data <= rng_o_data + sin_o_data;
	end
	default: begin
	    rg_o_data <= 0;
	end
	
  endcase
 
 end

endmodule