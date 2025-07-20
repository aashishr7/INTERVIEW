//constraint to generate 0, 1,x,z randomly
class states;
  
  randc int a;
  logic data;
  constraint a1{a inside{[1:4]};};
  
  function void Select();
    
    case(a)
      1: data = 0;
      2: data = 1;
      3: data = 'hx;
      4: data = 'hz;
      default: $display("default");
    endcase
    
  endfunction
  
  function void display();
    $display("a=%0d  data=%0d", a, data);
    
  endfunction
  
endclass

module test;
  
  states st;
  
  initial begin
    st = new();
    repeat(10) begin
    st.randomize();
    st.Select();
    st.display();
    end
  end
endmodule
      /*

      Output

# KERNEL: a=3  data=x
# KERNEL: a=2  data=1
# KERNEL: a=4  data=z
# KERNEL: a=1  data=0
# KERNEL: a=3  data=x
# KERNEL: a=1  data=0
# KERNEL: a=2  data=1
# KERNEL: a=4  data=z
# KERNEL: a=3  data=x
# KERNEL: a=2  data=1
