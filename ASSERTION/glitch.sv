// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module glitch_detection_tb;

  // Clock and reset
  reg clk = 0;
  reg reset_n = 0;
  always #5 clk = ~clk;  // 100MHz clock

  // Signal to test
  reg sig;

  // Glitch generation
  initial begin
    sig = 0;
    #20 reset_n = 1; // Deassert reset
    #20 sig = 1;      // Normal transition
    #10 sig = 0;      // Normal fall
    #7  sig = 1;      // Glitch rising (mid-cycle)
    #2  sig = 0;      // Glitch falling
    #20 sig = 1;      // Normal transition again
    #20 $finish;
  end

  // Assertion to detect glitch
  property no_glitch;
    @(posedge clk) disable iff (!reset_n)
    //  !(sig && $past(sig == 0)) && !(~sig && $past(sig == 1));
    $rose(clk) ##1 $fell(clk) ##1 $rose(clk);
  endproperty

  assert property (no_glitch) $display("No_glitch clk = %0d sig =%0d", clk, sig);
    else $error("\nGlitch detected at time %0t clk = %0d sig =%0d\n", $time, clk, sig);

      initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    
endmodule
/*
output

# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 25000 clk = 1 sig =0
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 35000 clk = 1 sig =0
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 45000 clk = 1 sig =1
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 55000 clk = 1 sig =0
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 65000 clk = 1 sig =0
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 75000 clk = 1 sig =0
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 85000 clk = 1 sig =1
# KERNEL: Error: testbench.sv (35): 
# KERNEL: Error: Glitch detected at time 95000 clk = 1 sig =1
# RUNTIME: Info: RUNTIME_0068 testbench.sv (24): $finish called.
