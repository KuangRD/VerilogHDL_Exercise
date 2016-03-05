`timescale 1ns/1ns
module a_latch(q,clock,d);
//Exercise 7.9

  input clock,d;
  output q;
  reg q;
  
  always
  wait(clock) #1 q=d;
  
endmodule  
  
module stimulus7_9;
  
  reg clock = 1'b0,d;
  wire q;
  a_latch my_latch(q,clock,d);
  
  initial
  forever #10 clock = ~clock;
  
  initial
    begin
    d=1'b0;
    #15 d = 1'b1;
    #10 d = 1'b0;
    #2  d = 1'b1;
    #5  d = 1'b0;
    #10 d = 1'b1;
    #3  d = 1'b0;
    
    #10  $finish; 
    end
endmodule