//Design.sv
module mux2_1
  (
    input in1, in2, sel,
    output out);
 
 
assign out = sel ? in2 : in1;
 
endmodule

//tb
// Code your testbench here
// or browse Examples
module tb;
  
  reg in1, in2, sel;
  wire out;
  
  mux2_1 dut (in1, in2, sel, out);
  
  covergroup cvr_mux;
    
    option.per_instance = 1;
    
    coverpoint in1
    {
      option.weight = 3;
      option.goal = 30;
      option.at_least = 50;
      option.comment = "I am aashish";
      option.detect_overlap = 1;
      option.auto_bin_max = 1;
    }
    
    coverpoint in2
    {
      option.weight = 15;
      option.at_least = 50;
    }
    
    coverpoint sel
     {
      option.weight = 15;
      option.at_least = 50;
    }
    
    coverpoint out;
    
  endgroup
  
  cvr_mux ci = new();
  
  initial begin 
    for(int i = 0; i < 100; i++)
      begin
        in1 = $urandom();
        in2 = $urandom();
        sel = $urandom();
        ci.sample(); 
        #10;
      end
    
  end
  
  
endmodule

//run.do

vsim +access+r;
run -all;
acdb save;
acdb report -db  fcover.acdb -txt -o cov.txt -verbose  
exec cat cov.txt;
exit

//Output
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       REPORT INFO       ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# SUMMARY
# ===============================================
# |     Property     |          Value           |
# ===============================================
# | User             | runner                   |
# | Host             | c942c93ae935             |
# | Tool             | Riviera-PRO 2023.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2025-07-20 13:40         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2025-07-20 13:40         |
# | Number of tests  | 1                        |
# ===============================================
# 
# 
# TEST DETAILS
# ==============================================
# | Property |              Value              |
# ==============================================
# | Test     | fcover.acdb:fcover              |
# | Status   | Ok                              |
# | Args     | asim +access+r                  |
# | Simtime  | 1000 ns                         |
# | Cputime  | 0.002 s                         |
# | Seed     | 1                               |
# | Date     | 2025-07-20 13:40                |
# | User     | runner                          |
# | Host     | c942c93ae935                    |
# | Host os  | Linux64                         |
# | Tool     | Riviera-PRO 2023.04 (simulator) |
# ==============================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++     DESIGN HIERARCHY    ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    77.941% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 77.941%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /tb : work.tb
# 
# 
#     SUMMARY
#     ==========================================================================
#     |    Coverage Type    | Weight | Local Hits/Total | Recursive Hits/Total |
#     ==========================================================================
#     | Covergroup Coverage |      1 |          77.941% |              77.941% |
#     |---------------------|--------|------------------|----------------------|
#     | Types               |        |            0 / 1 |                0 / 1 |
#     ==========================================================================
#     WEIGHTED AVERAGE LOCAL: 77.941%
#     WEIGHTED AVERAGE RECURSIVE: 77.941%
# 
# 
#     COVERGROUP COVERAGE
#     ================================================================
#     |         Covergroup         |   Hits   |  Goal /  |  Status   |
#     |                            |          | At Least |           |
#     ================================================================
#     | TYPE /tb/cvr_mux           |  77.941% | 100.000% | Uncovered |
#     ================================================================
#     | INSTANCE <UNNAMED1>        |  77.941% | 100.000% | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::in1 | 100.000% |  30.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0:1]              |      100 |       50 | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::in2 |  50.000% | 100.000% | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       51 |       50 | Covered   |
#     | bin auto[1]                |       49 |       50 | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::sel | 100.000% | 100.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       50 |       50 | Covered   |
#     | bin auto[1]                |       50 |       50 | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::out | 100.000% | 100.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       54 |        1 | Covered   |
#     | bin auto[1]                |       45 |        1 | Covered   |
#     ================================================================
# 
# 
# +++++++++++++++++++++++++++++++++++++++++++++
# ++++++++++       DESIGN UNITS      ++++++++++
# +++++++++++++++++++++++++++++++++++++++++++++
# 
# 
# CUMULATIVE SUMMARY
# =============================================
# |    Coverage Type    | Weight | Hits/Total |
# =============================================
# | Covergroup Coverage |      1 |    77.941% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 77.941%
# COVERED DESIGN UNITS: 0 / 1
# FILES: 1
# 
# 
# MODULE - work.tb
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    77.941% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 77.941%
# 
# 
#     COVERGROUP COVERAGE
#     ================================================================
#     |         Covergroup         |   Hits   |  Goal /  |  Status   |
#     |                            |          | At Least |           |
#     ================================================================
#     | TYPE /tb/cvr_mux           |  77.941% | 100.000% | Uncovered |
#     ================================================================
#     | INSTANCE <UNNAMED1>        |  77.941% | 100.000% | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::in1 | 100.000% |  30.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0:1]              |      100 |       50 | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::in2 |  50.000% | 100.000% | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       51 |       50 | Covered   |
#     | bin auto[1]                |       49 |       50 | Uncovered |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::sel | 100.000% | 100.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       50 |       50 | Covered   |
#     | bin auto[1]                |       50 |       50 | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::out | 100.000% | 100.000% | Covered   |
#     |----------------------------|----------|----------|-----------|
#     | bin auto[0]                |       54 |        1 | Covered   |
#     | bin auto[1]                |       45 |        1 | Covered   |
#     ================================================================
# 
exit
# VSIM: Simulation has finished.
