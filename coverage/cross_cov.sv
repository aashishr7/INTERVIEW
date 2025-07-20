module tb;
 
  reg [1:0] a;
  reg [1:0] b;
  reg [1:0] c;
  
  int i = 0;
  
   covergroup cg ;
   
    option.per_instance = 1;
   
   cp1:  coverpoint a
     {
       bins a1[] = {[3:0]};
     }
     
   cp2:  coverpoint b
     {
       bins b1[] = {[3:0]};
     }
     
    cp3:  coverpoint c
     {
       bins c1[] = {[3:0]};
     }
     
         
   //  cross wr, din;
     
   cp1xcp2xcp3:  cross cp1,cp2,cp3;
   cp1xcp2:  cross cp1,cp2
     {
     
       bins a_0_1_b = binsof(cp1)intersect {0,1} && binsof(cp2) ; 
      
     }
     cp2xcp3:  cross cp2,cp3
     {
     
       bins b_3_c = binsof(cp2)intersect {3} && binsof(cp3) ; 
      
     }
     cp2xcp3xcp1:  cross cp1,cp2,cp3
     {
     
       bins b_3_c = binsof(cp1)intersect {3} && binsof(cp2)intersect {3} && binsof(cp3)intersect {3} ; 
      
     }
  
  endgroup
  
  ///////////////////ignore bins to remove from coverage calc
  //////////// bins to include coverage in computation
  
 
  cg ci;
 
  initial begin
    ci = new();
   
    for (i = 0; i <10; i++) begin
      a = $urandom();
      b = $urandom();
      c = $urandom();
      ci.sample();
      $display("a : %d b : %0d  c : %0d", a,b,c);
      #10;
    end
   
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #101;
    $finish();
  end
 
endmodule

///Output


# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
run -all;
# KERNEL: a : 1 b : 2  c : 1
# KERNEL: a : 2 b : 1  c : 1
# KERNEL: a : 0 b : 0  c : 0
# KERNEL: a : 2 b : 2  c : 2
# KERNEL: a : 2 b : 2  c : 3
# KERNEL: a : 3 b : 0  c : 3
# KERNEL: a : 1 b : 3  c : 2
# KERNEL: a : 2 b : 2  c : 1
# KERNEL: a : 2 b : 0  c : 1
# KERNEL: a : 1 b : 2  c : 0
# RUNTIME: Info: RUNTIME_0068 testbench.sv (83): $finish called.
# KERNEL: Time: 101 ns,  Iteration: 0,  Instance: /tb,  Process: @INITIAL#79_1@.
# KERNEL: stopped at time: 101 ns
# VSIM: Simulation has finished. There are no more test vectors to simulate.
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt -verbose;
# ACDB: Coverage report "cov.txt" was generated successfully.
exec cat cov.txt;
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
# | Host             | a24593b3a26e             |
# | Tool             | Riviera-PRO 2023.04      |
# | Report file      | /home/runner/cov.txt     |
# | Report date      | 2025-07-20 13:26         |
# | Report arguments | -verbose                 |
# | Input file       | /home/runner/fcover.acdb |
# | Input file date  | 2025-07-20 13:26         |
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
# | Simtime  | 101 ns                          |
# | Cputime  | 0.112 s                         |
# | Seed     | 1                               |
# | Date     | 2025-07-20 13:26                |
# | User     | runner                          |
# | Host     | a24593b3a26e                    |
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
# | Covergroup Coverage |      1 |    65.148% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE INSTANCE-BASED COVERAGE: 65.148%
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
#     | Covergroup Coverage |      1 |    65.148% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE LOCAL: 65.148%
# 
# 
#     COVERGROUP COVERAGE
#     ===================================================================
#     |          Covergroup           |   Hits   |  Goal /  |  Status   |
#     |                               |          | At Least |           |
#     ===================================================================
#     | TYPE /tb/cg                   |  65.148% | 100.000% | Uncovered |
#     ===================================================================
#     | INSTANCE <UNNAMED1>           |  65.148% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin a1[0]                     |        1 |        1 | Covered   |
#     | bin a1[1]                     |        3 |        1 | Covered   |
#     | bin a1[2]                     |        5 |        1 | Covered   |
#     | bin a1[3]                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin b1[0]                     |        3 |        1 | Covered   |
#     | bin b1[1]                     |        1 |        1 | Covered   |
#     | bin b1[2]                     |        5 |        1 | Covered   |
#     | bin b1[3]                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin c1[0]                     |        2 |        1 | Covered   |
#     | bin c1[1]                     |        4 |        1 | Covered   |
#     | bin c1[2]                     |        2 |        1 | Covered   |
#     | bin c1[3]                     |        2 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp1xcp2xcp3 |  15.625% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[0],b1[0],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[3],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[0],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[3]>       |        1 |        1 | Covered   |
#     | bin <a1[3],b1[0],c1[3]>       |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp1xcp2     |  55.555% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[2],b1[0]>             |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1]>             |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2]>             |        3 |        1 | Covered   |
#     | bin <a1[3],b1[0]>             |        1 |        1 | Covered   |
#     | bin a_0_1_b                   |        4 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp2xcp3     |  69.230% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <b1[0],c1[0]>             |        1 |        1 | Covered   |
#     | bin <b1[0],c1[1]>             |        1 |        1 | Covered   |
#     | bin <b1[0],c1[3]>             |        1 |        1 | Covered   |
#     | bin <b1[1],c1[1]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[0]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[1]>             |        2 |        1 | Covered   |
#     | bin <b1[2],c1[2]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[3]>             |        1 |        1 | Covered   |
#     | bin b_3_c                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp2xcp3xcp1 |  15.625% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[0],b1[0],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[3],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[0],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[3]>       |        1 |        1 | Covered   |
#     | bin <a1[3],b1[0],c1[3]>       |        1 |        1 | Covered   |
#     ===================================================================
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
# | Covergroup Coverage |      1 |    65.148% |
# |---------------------|--------|------------|
# | Types               |        |      0 / 1 |
# =============================================
# CUMULATIVE DESIGN-BASED COVERAGE: 65.148%
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
#     | Covergroup Coverage |      1 |    65.148% |
#     |---------------------|--------|------------|
#     | Types               |        |      0 / 1 |
#     =============================================
#     WEIGHTED AVERAGE: 65.148%
# 
# 
#     COVERGROUP COVERAGE
#     ===================================================================
#     |          Covergroup           |   Hits   |  Goal /  |  Status   |
#     |                               |          | At Least |           |
#     ===================================================================
#     | TYPE /tb/cg                   |  65.148% | 100.000% | Uncovered |
#     ===================================================================
#     | INSTANCE <UNNAMED1>           |  65.148% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp1    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin a1[0]                     |        1 |        1 | Covered   |
#     | bin a1[1]                     |        3 |        1 | Covered   |
#     | bin a1[2]                     |        5 |        1 | Covered   |
#     | bin a1[3]                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp2    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin b1[0]                     |        3 |        1 | Covered   |
#     | bin b1[1]                     |        1 |        1 | Covered   |
#     | bin b1[2]                     |        5 |        1 | Covered   |
#     | bin b1[3]                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | COVERPOINT <UNNAMED1>::cp3    | 100.000% | 100.000% | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | bin c1[0]                     |        2 |        1 | Covered   |
#     | bin c1[1]                     |        4 |        1 | Covered   |
#     | bin c1[2]                     |        2 |        1 | Covered   |
#     | bin c1[3]                     |        2 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp1xcp2xcp3 |  15.625% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[0],b1[0],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[3],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[0],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[3]>       |        1 |        1 | Covered   |
#     | bin <a1[3],b1[0],c1[3]>       |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp1xcp2     |  55.555% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[2],b1[0]>             |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1]>             |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2]>             |        3 |        1 | Covered   |
#     | bin <a1[3],b1[0]>             |        1 |        1 | Covered   |
#     | bin a_0_1_b                   |        4 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp2xcp3     |  69.230% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <b1[0],c1[0]>             |        1 |        1 | Covered   |
#     | bin <b1[0],c1[1]>             |        1 |        1 | Covered   |
#     | bin <b1[0],c1[3]>             |        1 |        1 | Covered   |
#     | bin <b1[1],c1[1]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[0]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[1]>             |        2 |        1 | Covered   |
#     | bin <b1[2],c1[2]>             |        1 |        1 | Covered   |
#     | bin <b1[2],c1[3]>             |        1 |        1 | Covered   |
#     | bin b_3_c                     |        1 |        1 | Covered   |
#     |-------------------------------|----------|----------|-----------|
#     | CROSS <UNNAMED1>::cp2xcp3xcp1 |  15.625% | 100.000% | Uncovered |
#     |-------------------------------|----------|----------|-----------|
#     | bin <a1[0],b1[0],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[0]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[1],b1[3],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[0],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[1],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[1]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[2]>       |        1 |        1 | Covered   |
#     | bin <a1[2],b1[2],c1[3]>       |        1 |        1 | Covered   |
#     | bin <a1[3],b1[0],c1[3]>       |        1 |        1 | Covered   |
#     ===================================================================
# 
exit;
# VSIM: Simulation has finished.
