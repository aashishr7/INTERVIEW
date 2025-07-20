module mux_2_1 (clk, rst, D0, D1, S, Q);
  input clk;
  input rst;
  input  D0;
  input  D1;
  input  S;
  output reg Q;


  always @(posedge clk ) begin
    if(!rst)begin
  case (S)
    1'b0: Q = D0;
    1'b1: Q = D1;
    default: Q = 0; // Handle undefined select values
  endcase
    end else begin
      Q=0; end
end

endmodule
