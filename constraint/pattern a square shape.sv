`define N 6

class packet;
  rand bit data[`N][`N];

  constraint A1 { 
    foreach (data[i, j]) {
      if(i==0 | i== `N-1 | j==0 | j==`N-1) {
      //data[i][0] == 1;
     // data[0][j] == 1;
      //data[`N-1][j] == 1;
      //data[i][`N-1] == 1;
        data[i][j] ==1;
      } else
          data[i][j] ==0;
      
    }
  }

  function void display();
    $display("%p", data);
    foreach (data[i]) begin
      string line = ""; // Create a line for each row
      foreach (data[i][j]) begin
        line = {line, $sformatf("%0d ", data[i][j])}; // Append to line
      end
      $display("%s", line); // Display the whole row at once
    end
  endfunction
endclass

module tb;
  initial begin 
    packet pkt;
    pkt = new();
    repeat (1) begin
      if (pkt.randomize())
        pkt.display();
      else
        $display("\nRandomization failed!!\n");
    end
  end 
endmodule
//Output
/*
# KERNEL: '{'{1, 1, 1, 1, 1, 1}, '{1, 0, 0, 0, 0, 1}, '{1, 0, 0, 0, 0, 1}, '{1, 0, 0, 0, 0, 1}, '{1, 0, 0, 0, 0, 1}, '{1, 1, 1, 1, 1, 1}}
# KERNEL: 1 1 1 1 1 1 
# KERNEL: 1 0 0 0 0 1 
# KERNEL: 1 0 0 0 0 1 
# KERNEL: 1 0 0 0 0 1 
# KERNEL: 1 0 0 0 0 1 
# KERNEL: 1 1 1 1 1 1 
# KERNEL: Simulation has finished. There are no more test vectors to simulate. */
    
