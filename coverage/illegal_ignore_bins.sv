module tb;
  
  reg [2:0] opcode;
  reg [2:0] a,b;
  reg [3:0] res;
  reg [7:0] d;
  integer i = 0;
 
  always_comb
    begin
  case (opcode)
    0: res = a + b;
    1: res = a - b;
    2: res = a;
    3: res = b;
    4: res = a & b;
    5: res = a | b;
    default : res = 0;
  endcase
    end
  
  covergroup c;
    option.per_instance  = 1;
    
    coverpoint opcode {
    
      bins valid_opcode[] = {[0:5]};
     // illegal_bins invalid_opcode[] = {6,7};
      ignore_bins invalid_opcode[] = {6,7};
    
    }
    
    coverpoint d 
    {
      bins validc = {[1:50],[62:78],[80:255]};
      wildcard bins wildc = {8'b?0?0?0?0};
      ignore_bins igb[] = {[51:61]};
      illegal_bins ilb[] = {79};
      
      bins undef = {2'bx?, 2'b?x};
    }
    
    
    
  endgroup
  
 
  c ci;
 
  initial begin
     ci = new();
    
    
    
    for (i = 0; i <400; i++) begin
      a = $urandom();
      b = $urandom();
      d = $urandom();
      $display("d=%0d",d);
      opcode = $urandom();
      ci.sample();
      #10;
    end
    
    
  end
  
  
  
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #400;
    $finish();
  end
 
endmodule

