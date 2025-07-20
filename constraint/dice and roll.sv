//there are 5 player and each rolls a dice 5times the gol is to sum up all their rolls and
//determine the players withe the highest total score tell me who is the winner

class cons;
 rand int player_count;
 rand int chance;
 rand int a[][];
 rand int b[];
  constraint c_player_count { player_count inside {[1:100]}; }

 constraint a1 {
 chance inside {[1:5]};
 a.size == player_count;
 foreach(a[i]) a[i].size == chance;
 }

 constraint a2 { foreach(a[i, j]) a[i][j] inside {[1:6]}; }

 constraint b_size { b.size == player_count; }

 constraint b1 { foreach(b[i]) b[i] == a[i].sum(); }

 function void post_randomize();
 int qu[$];
 int max_value;
 int count;

 foreach(b[i]) begin qu[i]=b[i];end
 b.rsort();

 max_value=b[0];
 $display("max score %0d",max_value);


 foreach(qu[i]) begin
 if(qu[i]==max_value)begin
 count++;
   $display("Winner %0d === Score: %0d player_number: %0d", count, qu[i],i+1);
 end
 end
 endfunction
  function void display();
    $display("a =%p",a);
    foreach(a[i])
      
      $display("player %0d sum= %p",i+1,a[i].sum()); 
  endfunction
endclass

module tb;
 cons c;
 initial begin
 c = new();
 c.randomize();
   c.display();
 end
endmodule

/*Output
# KERNEL: max score 23
# KERNEL: Winner 1 === Score: 23 player_number: 30
# KERNEL: a ='{'{3, 1, 5, 4}, '{2, 4, 3, 6}, '{4, 2, 4, 5}, '{6, 5, 2, 1}, '{5, 4, 6, 4}, '{6, 4, 1, 2}, '{4, 5, 6, 6}, '{3, 5, 6, 2}, '{5, 4, 5, 2}, '{1, 4, 5, 1}, '{2, 1, 5, 5}, '{6, 6, 3, 4}, '{4, 4, 4, 1}, '{5, 4, 3, 1}, '{4, 6, 3, 2}, '{1, 2, 5, 5}, '{1, 4, 5, 4}, '{1, 3, 1, 4}, '{6, 5, 1, 1}, '{4, 3, 1, 4}, '{2, 5, 3, 2}, '{2, 1, 5, 3}, '{5, 4, 5, 1}, '{6, 2, 1, 6}, '{1, 3, 5, 3}, '{6, 1, 2, 6}, '{6, 1, 5, 5}, '{6, 4, 4, 6}, '{4, 6, 1, 4}, '{6, 6, 5, 6}, '{6, 5, 2, 5}, '{5, 4, 6, 3}, '{5, 1, 5, 2}, '{1, 1, 1, 2}, '{1, 2, 2, 1}, '{2, 4, 4, 6}, '{6, 6, 1, 4}, '{3, 5, 3, 3}, '{1, 3, 3, 1}, '{4, 2, 6, 5}, '{5, 2, 4, 6}, '{3, 2, 3, 3}, '{3, 5, 4, 5}, '{1, 3, 6, 4}, '{1, 3, 2, 6}, '{2, 6, 6, 4}, '{4, 4, 2, 1}, '{5, 3, 5, 1}, '{4, 4, 4, 6}}
# KERNEL: player 1 sum= 13
# KERNEL: player 2 sum= 15
# KERNEL: player 3 sum= 15
# KERNEL: player 4 sum= 14
# KERNEL: player 5 sum= 19
# KERNEL: player 6 sum= 13
# KERNEL: player 7 sum= 21
# KERNEL: player 8 sum= 16
# KERNEL: player 9 sum= 16
# KERNEL: player 10 sum= 11
# KERNEL: player 11 sum= 13
# KERNEL: player 12 sum= 19
# KERNEL: player 13 sum= 13
# KERNEL: player 14 sum= 13
# KERNEL: player 15 sum= 15
# KERNEL: player 16 sum= 13
# KERNEL: player 17 sum= 14
# KERNEL: player 18 sum= 9
# KERNEL: player 19 sum= 13
# KERNEL: player 20 sum= 12
# KERNEL: player 21 sum= 12
# KERNEL: player 22 sum= 11
# KERNEL: player 23 sum= 15
# KERNEL: player 24 sum= 15
# KERNEL: player 25 sum= 12
# KERNEL: player 26 sum= 15
# KERNEL: player 27 sum= 17
# KERNEL: player 28 sum= 20
# KERNEL: player 29 sum= 15
# KERNEL: player 30 sum= 23
# KERNEL: player 31 sum= 18
# KERNEL: player 32 sum= 18
# KERNEL: player 33 sum= 13
# KERNEL: player 34 sum= 5
# KERNEL: player 35 sum= 6
# KERNEL: player 36 sum= 16
# KERNEL: player 37 sum= 17
# KERNEL: player 38 sum= 14
# KERNEL: player 39 sum= 8
# KERNEL: player 40 sum= 17
# KERNEL: player 41 sum= 17
# KERNEL: player 42 sum= 11
# KERNEL: player 43 sum= 17
# KERNEL: player 44 sum= 14
# KERNEL: player 45 sum= 12
# KERNEL: player 46 sum= 18
# KERNEL: player 47 sum= 11
# KERNEL: player 48 sum= 14
# KERNEL: player 49 sum= 18
# KERNEL: Simulation has finished. There are no more test vectors to simulate. */
