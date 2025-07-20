class transaction #(parameter WIDTH = 16, type D_TYPE = bit [7:0]);
  randc bit [WIDTH-1:0] data, low, mid, high;
  randc D_TYPE id;
  rand bit [7:0] array[];
  int array2[20];
  rand logic a, b;
  rand  bit [16:0] d;
  int i,j,k,l, result;
  
  //1. data range [25:50], id >40
/*  constraint d1  {data inside{[25:50]};};
  constraint id1 {id > 40;};  */
  
  //2. constraint for low mid high
 /* constraint d2 {
    low inside {[0:25]};
    mid inside {[26:75]};
    high inside {[76:100]};
  };    */
  
  //3. random value of range 1-34, 127, 129-156
 // constraint d2  {data inside{[1:34],127,[129:156],[192:202],[157:260]};};
  
  //4. without inside function 34 > data >43
 /* constraint d1 {data >34;};
  constraint d2 {data <43;};  */
  
  // 5. unique element
 /* constraint d1  {data inside{[0:50]};};
  constraint id1 {unique{id};};  */
  
  //6. 
 // constraint d2  {data inside{[1:34],127,[129:156],[192:202],[157:260]}; array.size()==data;};
  
  //7. to generate 0,1 ,x,z
 /* function void post_randomize;
    if(b)
      a = a ? 'x : 'z;
  endfunction  */
  
 /*  constraint d3  {data inside{[1:4]};
  
                  function logic value();   not working
                    case(data)
                      1: return 1'b1;
                      2: return 1'b0;
                      3: return 1'bx;
                      4: return 1'bz;
                    endcase
                  endfunction  */
  //8. multiple of power 2
  //constraint d4 {data == 2**id;};
  
  //9. having 32 bit value only single bit high value need to be accessed
  //constraint d5{$countones(d) ==1; };
  
  //10. array size 5 to 10 values and array should be in ascending/descending order
/*  constraint d1{
    data inside {[5:10]}; 
    array.size == data;
  };
  
  
  constraint a1 {
    foreach(array[j])
      if(j > 0)
       // array[j-1] > array[j]; // descending order
        array[j-1] < array[j];     // ascending order
              };     */
  
  //11. pattern 0102030405
/*  constraint a1 {array.size() == 10;};
  constraint a2 {
    foreach(array[j])
      if(j %2 ==0)  // even number
      array[j] == 0;
    else if(j %2 !=0)
      array[j] == (j+1)/2;
             };   */
  
 /* //12. unique no 99-100
  real d1;
  constraint a2 {data inside {[990:1000]};};
  function void post_randomize();
  d1 = data/10.0;
  endfunction */
  
  //13. divisible by 5
 // constraint val_data {data % 5==0; data <= 100;};
  
  
  
  //14. odd number range 10-30
  
/*  constraint val_data {
           data %2 !=0;
           data inside{[10:30]};
                }; */
  //15. prime numbers between 1 -100
/*  constraint d2{
    data %2 !=0;
    data %3 !=0;
    data %5 !=0;
    data %7 !=0;
    
   // data %1 ==0;
    data inside {[1:100]};
        
  };  */
  
 // 16. pattern 9753186420

/*  constraint a1{
    array.size() ==10;
    foreach(array[j])
      if(j%9==0)
        array[j] == j;
    else if(j%8==0)
      array[j] == j-1;
    else if(j%7==0)
      array[j] == j-2;
    else if(j%6==0)
      array[j] == j-3;
    else if(j%5==0)
      array[j] == j-4;
    else if(j%4==0)
      array[j] == j+4;
    else if(j%3==0)
      array[j] == j+3;
    else if(j%2==0)
      array[j] == j+2;
    else if(j%1==0)
      array[j] == j+1;
     else 
      array[j] == j;
      }; */
  
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
   // $display("\nsize = %0d ", array.size()); //10. 11.
  foreach(array[j])    //10. 11.
    $display("Add = %0d array = %p", j, array[j]);  //10. 11
 //  foreach(array[k])    //16
   // $display(" add= %0d array2 = %0p", j,array2[j]);  //16
    //$display("transaction class: id = %0d and data = %0d", id, data); // 12/ 13. 14. 15. 
    //$display("transaction class: id = %0f and data = %0d", d1, data); // 12/
   // $display("transaction class: a = %0d and b = %0d", a, b);
   // $display("transaction class: low = %0d mid = %0d High = %0d", low, mid, high);
    //$display("d-32 bit ==  'b%0b 'h%0h", d, d); //9. 
  endfunction
  
endclass

// TB
module class_tb;
 int i,j;
 // parent_class p_tr;
 // child_class c_tr;
   transaction tr1;
// transaction #(6, byte)tr2;
    
   initial begin
     
    tr1 = new();
 //   tr2 =new();
    
  
     
   tr1.display();
   //tr2.rand_mode(0);
   //tr2.randomize();
   //tr2.rand_mode(1);
   // tr2.data = 7;
   //tr2.id = 2;
     for(i=0; i<1; i++) begin
 tr1.randomize();
     //  tr1.value();
    tr1.display();
       $display("array =%0p", tr1.array);  //11.
                    
       
     end 
  end
  
endmodule
