module SISO(clk, rst, SI, SO);
  input clk;
  input rst;
  input [7:0] SI;
  output [7:0 SO;
          
          reg [7:0] shift_reg;
          
          always@(posedge clk)
            if(rst) begin
              shift_reg <=0;
            end else begin
              shift_reg <= {shift_reg[6:0], SI};
              
            end
          
          assign SO = shift_reg[7];
          
          endmodule
