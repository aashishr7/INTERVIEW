//   Aashish

class shape;
  
  virtual function void display(int a, int b); // method is declared as virtual to allow overriding in derived class
    $display("\n-------------------------------------------------------");
    $display("[SHAPE]:: Inside Parent class");
    $display("-------------------------------------------------------");
  endfunction
  
endclass

class circle extends shape;
  
  function void display(int a, int b);
    $display("\n-------------------------------------------------------");
    $display("[CIRCLE]:: Draw a circle of radius=%0d, diameter = %0d",a,b);
    $display("-------------------------------------------------------");
  endfunction
  
endclass

class square extends shape;
  
  function void display(int a, int b);
    $display("\n-------------------------------------------------------");
    $display("[SQUARE]:: Draw a square length=%0d, width = %0d",a,b);
    $display("-------------------------------------------------------");
  endfunction
  
endclass

class rectangle extends shape;
  
  function void display(int a, int b);
    $display("\n-------------------------------------------------------");
    $display("[RECTANGLE]:: Draw a rectangle length=%0d, width= %0d",a,b);
    $display("-------------------------------------------------------");
    super.display(7,9); // to access the base class methods
  endfunction
  
endclass

module test;
  
  shape s=new();
  circle c=new();
  square sq=new();
  rectangle r=new();
  
   
  initial begin
  s=sq;
    s.display(6,6);
    
   s=c; 
    s.display(3,6);
    
    s=r;
    s.display(4,8);
  end
 
endmodule
  /* Output
# KERNEL: -------------------------------------------------------
# KERNEL: [SQUARE]:: Draw a square length=6, width = 6
# KERNEL: -------------------------------------------------------
# KERNEL: 
# KERNEL: -------------------------------------------------------
# KERNEL: [CIRCLE]:: Draw a circle of radius=3, diameter = 6
# KERNEL: -------------------------------------------------------
# KERNEL: 
# KERNEL: -------------------------------------------------------
# KERNEL: [RECTANGLE]:: Draw a rectangle length=4, width= 8
# KERNEL: -------------------------------------------------------
# KERNEL: 
# KERNEL: -------------------------------------------------------
# KERNEL: [SHAPE]:: Inside Parent class
# KERNEL: -------------------------------------------------------
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
  
