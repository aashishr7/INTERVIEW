// Code your testbench here
// or browse Examples
class transaction #(parameter WIDTH = 16, type D_TYPE = bit [7:0]);
  randc bit [WIDTH-1:0] data, low, mid, high;
  randc D_TYPE id;
  rand bit [7:0] array[];
  int array2[20];
  rand logic a, b;
  rand  bit [16:0] d;
  int i,j,k,l, result;
 
  //17. pattern 1010101010
    constraint a1{
      array.size() ==10;
      foreach(array[j])
        if(j%2==1)
          array[j] ==0;
      else 
        array[j] == 1;
    };
  
  
 // constraint val_id {id dist {3:=4, [5:8] :=4};};
  //constraint val_id {id dist {3:=4, 5:/4};};
    
  function void display();
  foreach(array[j])    //10. 11.
    $display("Add = %0d array = %p", j, array[j]);  
  endfunction
  
endclass

// TB
module class_tb;
 int i,j;
   transaction tr1;    
   initial begin 
    tr1 = new();
   tr1.display();
  
     for(i=0; i<1; i++) begin
       tr1.randomize();
       tr1.display();
       $display("array =%0p", tr1.array);     
     end 
  end 
endmodule


//Output
// # KERNEL: array =1 0 1 0 1 0 1 0 1 0
