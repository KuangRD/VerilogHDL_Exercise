module oscillate(clk);
  
  output clk;
  reg clk;
  
  initial
  begin 
    clk =1'b0;
    forever #30 clk = ~clk;
  end 
  
  initial
   #100 $stop ;
  
endmodule
