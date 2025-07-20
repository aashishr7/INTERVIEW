module pe (clk, rst, D, Q);
  input clk, rst;
  input [7:0] D;
  output reg [2:0] Q;
  
  always @(posedge clk) begin
    if(!rst) begin
  casez(D)
    8'b1???????: Q = 3'b111;
    8'b01??????: Q = 3'b110;
    8'b001?????: Q = 3'b101;
    8'b0001????: Q = 3'b100;
    8'b00001???: Q = 3'b011;
    8'b000001??: Q = 3'b010;
    8'b0000001?: Q = 3'b001;
    8'b00000001: Q = 3'b000;
    default: $display("wrong data");
  endcase
    end else begin
      Q=3'b000; end
  end
endmodule
