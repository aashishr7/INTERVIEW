`define N 4
`define P 2
`define Q 4
class packet;
  rand bit[3:0] data[15];
  rand bit[31:0] a[15], b[16], c[18],d[25], e[25], f[1], g[32];
  
//{0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, 4, 0, 0, 5}
 constraint A1 {    
   foreach(data[i]) {
     if((i+1)%3==0)
         data[i] == (i/3)+1  ; else data[i] == 0;}             
                }
// {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}
constraint A2 { //a.size{11}; 
   foreach(a[i]) {
     if((i+1)%2==0) 
       a[i] == 0 ; else a[i] == 1;}             
                }     
  // Define Pattern using the value of N (N should be multiple of 2)
  // N = 2: 1010101010....
  // N = 4: 1100110011....
  // N = 6: 111000111000....
  // N = 8: 1111000011110000....
     
     constraint A3 { //a.size{11}; 
       foreach(b[i]) {
         if(i<`N/2) 
           b[i] == 1 ; 
         else if(i<`N)
           b[i] == 0;
         else
           b[i] == b[i-`N];
            }             
                } 
 
  // Define Pattern using the value of 'P'
  // N = 2: 0101010101....
  // N = 4: 001100110011....
  // N = 6: 000111000111....
  // N = 8: 0000111100001111....
     constraint A4 { //a.size{11}; 
       foreach(c[i]) {
         if(i<`N/2) 
           c[i] == 0 ; 
         else if(i<`N)
           c[i] == 1;
         else
           c[i] == c[i-`N];
            }             
                }
         
  // Define Pattern using the value of 'P'
  // P =2 {0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12}
  // P =4 {0, 0, 0, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6}
  // P =6 {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4}
         constraint A5{
           foreach(d[i])
             if((i)<=`P/2) 
               d[i] == 0 ; 
           else
             d[i] == ((i-2)/`P)+1;        
            }
   // Define Pattern using the value of 'Q'
   //Q=1 {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25}
   //Q=2 {0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0}
   //Q=3 {0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, 4, 0, 0, 5, 0, 0, 6, 0, 0, 7, 0, 0, 8, 0}
   //Q=4 {0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6, 0}
         
       constraint A6{
         foreach(e[i])
           if((i+1)%`Q) 
               e[i] == 0 ; 
           else
             e[i] == (i/`Q)+1;        
            }

         constraint A7 {
           foreach(f[i]){ $countones(f[i]) == 18;
                        }
         }
                      
     constraint A8 {
       foreach(g[i]){ if (i == 1)
          g[i] == (i==1); // First two bits: 01
        else if (i < 6)
          g[i] == (i >= 4); // Next four bits: 0011
        else if ( i< 12)
          g[i] == ((i - 6) >= 3);//$countones(g[i]) == 16;
                        }
         }
         
function void display();
   $display("%p", data);
   $display("%p", a);
   $display("%p", b);
   $display("%p", c);
   $display("%p", d);
   $display("%p", e);
   $display("%p--- %0b", f, f[0]);
   $display("%p", g);
           
 
 endfunction
endclass

module tb;
  initial begin 
    packet pkt;
    pkt = new();
    pkt.randomize();
    pkt.display();
   
   end 
endmodule 

/* output

# KERNEL: '{0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, 4, 0, 0, 5}
# KERNEL: '{1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}
# KERNEL: '{1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0}
# KERNEL: '{0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0}
# KERNEL: '{0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12}
# KERNEL: '{0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 4, 0, 0, 0, 5, 0, 0, 0, 6, 0}
# KERNEL: '{517062233}--- 11110110100011011111001011001
# KERNEL: '{0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1448836505, 3886102609, 2030534091, 1697640087, 2521699243, 1486038289, 3480011635, 1450303767, 3665460446, 263157635, 258198328, 1175352200, 1274491501, 907119854, 1136003978, 4039848974, 1268235586, 3628177152, 3995951480, 1918157525}
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
