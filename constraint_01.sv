// Code your testbench here
// or browse Examples
//write a seq_item pkt 8 bit header and 32 bit data?
 
//generate byte alined address, data pattern is 010101 //// data 1's < 16
 
class seq_item;// extends uvm_sequence_item;
 
   rand bit [7:0] header;
  rand bit [31:0] data[32];
   rand byte addr;
 
constraint A1{
           foreach(data[i])
              if(i%2==0)
                 data[i] ==1;
                else
                 data[i] == 0;  
}
 
constraint A2{ foreach(data[i])
  $countones(data[i]) <= 16;}
 
  rand bit [31:0] arr[];
 
constraint A4{ arr.size inside {[10:20]};
              foreach(arr[i])
                  arr[i] inside {[1:100]};
}
  function void display();
    $display("%0p",data);
    $display("%0p",arr);
  endfunction
endclass
              
              module tb;
                seq_item txn;
                initial begin
                  txn = new();
                  txn.randomize();
                  txn.display();
                end
                initial begin
                    $dumpfile("dump.vcd");
    $dumpvars(0);
                end
              endmodule
