
class packet;
  rand bit[31:0] data[15];
  rand bit[31:0] a[2];
  
 constraint A1 { 
   foreach(data[i]) {
     data[i] == i*10 +9  ; }               
                }

 constraint A2 { 
   foreach(a[i]){
     if(i==0 && a[i] ==1) 
       a[i+1] ==1;
     else if(i ==($size(a)-1) && a[i] == 1)
       a[i-1] ==1;
     else if((i>0 && i <($size(a)-1)) && a[i]==1)
       
       if(a[i-1] ==1)
         a[i+1] ==0;
     else 
       a[i+1] ==1;
     
     
     //$countones(a[i])  ==2; 
   }
              }
     
     
function void display();
    $display("%p", data);
   $display("%p --\n %b, %b", a,a[0],a[1]);
  
  foreach (a[i]) begin
    $display("%b",a[i]); end
 endfunction
endclass

module tb;
  initial begin 
    packet pkt;
    pkt = new();
    if(pkt.randomize())
    pkt.display();
    else
      $display("\nfailed!!\n");
   
   end 
endmodule 

