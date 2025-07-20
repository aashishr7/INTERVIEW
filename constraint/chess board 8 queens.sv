// Write a System Verilog Constraint for following:
// Eight queens must be placed on an 8×8 chessboard such that no two queens attack each other. This means:
// No two queens share the same row.
// No two queens share the same column.
// No two queens share the same diagonal.

class eight_queens;
  // Define the positions of queens
  // Each queen's position is represented by its row and column
  // rows[i] represents the row position of queen in column i
  rand bit [2:0] rows[8];
  
  // Constraint: No two queens share the same row
  constraint unique_rows {
    foreach (rows[i])
      rows[i] inside {[0:7]};
      
    // All rows must be unique
    foreach (rows[i])
      foreach (rows[j])
        if (i != j)
          rows[i] != rows[j];
  }
  
  // Constraint: No two queens on the same diagonal
  constraint no_diagonals {
    foreach (rows[i])
      foreach (rows[j])
        if (i != j) {
          // Check if queens are on the same diagonal
          // For diagonal: |row_diff| != |col_diff|
          // Since columns are already different (i != j), we only need to check diagonals
          (rows[i] - rows[j] != i - j) && 
          (rows[i] - rows[j] != j - i);
        }
  }
  
  // Display solution
  function void display();
    for (int r = 0; r < 8; r++) begin
      for (int c = 0; c < 8; c++) begin
        if (rows[c] == r)
          $write("Q ");
        else
          $write(". ");
      end
      $display("");
    end
    $display("");
  endfunction
endclass

module test;
  initial begin
    eight_queens q_puzzle;
    q_puzzle = new();
    
    // Randomize with constraints
    repeat (5) begin
      if (q_puzzle.randomize())
        q_puzzle.display();
      else
        $display("Failed to randomize");
    end
  end
endmodule

    /*
    Output
# KERNEL: . . Q . . . . . 
# KERNEL: . . . . . Q . . 
# KERNEL: . . . . . . . Q 
# KERNEL: Q . . . . . . . 
# KERNEL: . . . Q . . . . 
# KERNEL: . . . . . . Q . 
# KERNEL: . . . . Q . . . 
# KERNEL: . Q . . . . . . 
# KERNEL: 
# KERNEL: . . Q . . . . . 
# KERNEL: . . . . . Q . . 
# KERNEL: . . . . . . . Q 
# KERNEL: . Q . . . . . . 
# KERNEL: . . . Q . . . . 
# KERNEL: Q . . . . . . . 
# KERNEL: . . . . . . Q . 
# KERNEL: . . . . Q . . . 
# KERNEL: 
# KERNEL: . . . . . Q . . 
# KERNEL: . . . . . . . Q 
# KERNEL: . Q . . . . . . 
# KERNEL: . . . Q . . . . 
# KERNEL: Q . . . . . . . 
# KERNEL: . . . . . . Q . 
# KERNEL: . . . . Q . . . 
# KERNEL: . . Q . . . . . 
# KERNEL: 
# KERNEL: . . Q . . . . . 
# KERNEL: . . . . Q . . . 
# KERNEL: . . . . . . . Q 
# KERNEL: . . . Q . . . . 
# KERNEL: Q . . . . . . . 
# KERNEL: . . . . . . Q . 
# KERNEL: . Q . . . . . . 
# KERNEL: . . . . . Q . . 
# KERNEL: 
# KERNEL: . . . . Q . . . 
# KERNEL: . . . . . . Q . 
# KERNEL: Q . . . . . . . 
# KERNEL: . . . Q . . . . 
# KERNEL: . Q . . . . . . 
# KERNEL: . . . . . . . Q 
# KERNEL: . . . . . Q . . 
# KERNEL: . . Q . . . . . 
# KERNEL: 
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finished.
    
