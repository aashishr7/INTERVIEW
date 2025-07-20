// Code your testbench here
// or browse Examples
class cons;
 rand bit [16:0] a[10];
 rand int b[10];
 constraint a1 { unique {b}; foreach (b[i]) b[i] inside {[0:9]}; }
  
 constraint a2 {
 foreach (a[i]){foreach(a[i][j]) {
 if (b[i] == j)
 a[i][j] == 1;
 else
 a[i][j] == 0;
 }}
 }
   
   
   //constraint A1 { foreach(a[i]) a[i] == 2**i;}
   
 function void post_randomize();
 foreach (a[i]) begin
 $display("a = %p", a[i]);
 end
 endfunction
endclass
module tb;
 initial begin
 cons c;
 c = new;
 c.randomize();
 end
endmodule
                /*
 outpput
# KERNEL: a = 128
# KERNEL: a = 2
# KERNEL: a = 512
# KERNEL: a = 32
# KERNEL: a = 16
# KERNEL: a = 8
# KERNEL: a = 4
# KERNEL: a = 64
# KERNEL: a = 256
# KERNEL: a = 1
                
