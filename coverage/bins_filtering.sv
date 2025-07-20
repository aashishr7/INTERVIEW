//tb
module tb;
 
  reg [3:0] a; /// 0 -15 
  reg [4:0] b;
  integer i = 0;

  covergroup c;
    option.per_instance = 1;
    
    coverpoint a {
      bins zero = {0};
      //bins odd_a  = {1,3,5,7,9,11,13,15};
      //bins even_a = {2,4,6,8,10,12,14};
      bins odd_a[] = a with ((item > 0) && (item % 2 == 1));
      bins even_a[] = a with ((item > 0) && (item % 2 == 0));
      bins mul_3[] = a with ((item >0) && (item % 3 == 0));
    }
    
    coverpoint b {
      bins zero = {0};
      //bins odd_a  = {1,3,5,7,9,11,13,15};
      //bins even_a = {2,4,6,8,10,12,14};
     bins odd_b = b with ((item > 0) && (item % 5 == 1));
     bins even_b = b with ((item > 0) && (item % 7 == 0));
     bins mul_3 = b with ((item >0) && (item % 3 == 0));
    }
  endgroup
 
  c ci;
 
  initial begin
     ci = new();
   
    for (i = 0; i <20; i++) begin
      a = $urandom();
      b = $urandom();
      //$display("Value of a : %0d  | b : %0d",a,b);
      ci.sample();
      #10;
    end  
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #200;
    $finish();
  end
 
endmodule

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
# | Host             | 65c2c3e90313             |
# | Tool             | Riviera-PRO 2023.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2025-07-20 13:43         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2025-07-20 13:43         |
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
# | Simtime  | 200 ns                          |
# | Cputime  | 0.102 s                         |
# | Seed     | 1                               |
# | Date     | 2025-07-20 13:43                |
# | User     | runner                          |
# | Host     | 65c2c3e90313                    |
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
# | Covergroup Coverage |      1 |    75.595% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 75.595%
# COVERED INSTANCES: 0 / 1
# FILES: 1
# 
# 
# INSTANCE - /tb : work.tb
# 
# 
#     SUMMARY
#     =============================================
#     |    Coverage Type    | Weight | Hits/Total |
#     =============================================
#     | Covergroup Coverage |      1 |    75.595% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 75.595%
# 
# 
#     COVERGROUP COVERAGE
#     =============================================================
#     |        Covergroup        |  Hits   |  Goal /  |  Status   |
#     |                          |         | At Least |           |
#     =============================================================
#     | TYPE /tb/c               | 75.595% | 100.000% | Uncovered |
#     =============================================================
#     | INSTANCE <UNNAMED1>      | 75.595% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::a | 76.190% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | bin zero                 |       1 |        1 | Covered   |
#     | bin odd_a[1]             |       1 |        1 | Covered   |
#     | bin odd_a[3]             |       1 |        1 | Covered   |
#     | bin odd_a[5]             |       2 |        1 | Covered   |
#     | bin odd_a[7]             |       0 |        1 | Zero      |
#     | bin odd_a[9]             |       2 |        1 | Covered   |
#     | bin odd_a[11]            |       0 |        1 | Zero      |
#     | bin odd_a[13]            |       4 |        1 | Covered   |
#     | bin odd_a[15]            |       0 |        1 | Zero      |
#     | bin even_a[2]            |       2 |        1 | Covered   |
#     | bin even_a[4]            |       1 |        1 | Covered   |
#     | bin even_a[6]            |       2 |        1 | Covered   |
#     | bin even_a[8]            |       0 |        1 | Zero      |
#     | bin even_a[10]           |       2 |        1 | Covered   |
#     | bin even_a[12]           |       1 |        1 | Covered   |
#     | bin even_a[14]           |       1 |        1 | Covered   |
#     | bin mul_3[3]             |       1 |        1 | Covered   |
#     | bin mul_3[6]             |       2 |        1 | Covered   |
#     | bin mul_3[9]             |       2 |        1 | Covered   |
#     | bin mul_3[12]            |       1 |        1 | Covered   |
#     | bin mul_3[15]            |       0 |        1 | Zero      |
#     |--------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::b | 75.000% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | bin zero                 |       0 |        1 | Zero      |
#     | bin odd_b                |       4 |        1 | Covered   |
#     | bin even_b               |       4 |        1 | Covered   |
#     | bin mul_3                |       4 |        1 | Covered   |
#     =============================================================
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
# | Covergroup Coverage |      1 |    75.595% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 75.595%
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
#     | Covergroup Coverage |      1 |    75.595% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 75.595%
# 
# 
#     COVERGROUP COVERAGE
#     =============================================================
#     |        Covergroup        |  Hits   |  Goal /  |  Status   |
#     |                          |         | At Least |           |
#     =============================================================
#     | TYPE /tb/c               | 75.595% | 100.000% | Uncovered |
#     =============================================================
#     | INSTANCE <UNNAMED1>      | 75.595% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::a | 76.190% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | bin zero                 |       1 |        1 | Covered   |
#     | bin odd_a[1]             |       1 |        1 | Covered   |
#     | bin odd_a[3]             |       1 |        1 | Covered   |
#     | bin odd_a[5]             |       2 |        1 | Covered   |
#     | bin odd_a[7]             |       0 |        1 | Zero      |
#     | bin odd_a[9]             |       2 |        1 | Covered   |
#     | bin odd_a[11]            |       0 |        1 | Zero      |
#     | bin odd_a[13]            |       4 |        1 | Covered   |
#     | bin odd_a[15]            |       0 |        1 | Zero      |
#     | bin even_a[2]            |       2 |        1 | Covered   |
#     | bin even_a[4]            |       1 |        1 | Covered   |
#     | bin even_a[6]            |       2 |        1 | Covered   |
#     | bin even_a[8]            |       0 |        1 | Zero      |
#     | bin even_a[10]           |       2 |        1 | Covered   |
#     | bin even_a[12]           |       1 |        1 | Covered   |
#     | bin even_a[14]           |       1 |        1 | Covered   |
#     | bin mul_3[3]             |       1 |        1 | Covered   |
#     | bin mul_3[6]             |       2 |        1 | Covered   |
#     | bin mul_3[9]             |       2 |        1 | Covered   |
#     | bin mul_3[12]            |       1 |        1 | Covered   |
#     | bin mul_3[15]            |       0 |        1 | Zero      |
#     |--------------------------|---------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::b | 75.000% | 100.000% | Uncovered |
#     |--------------------------|---------|----------|-----------|
#     | bin zero                 |       0 |        1 | Zero      |
#     | bin odd_b                |       4 |        1 | Covered   |
#     | bin even_b               |       4 |        1 | Covered   |
#     | bin mul_3                |       4 |        1 | Covered   |
#     =============================================================
# 
exit
# VSIM: Simulation has finished.
