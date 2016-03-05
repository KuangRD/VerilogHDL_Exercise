module stimulus7_16;
  reg a = 0;
  
  initial begin 
    repeat(4) #5;
    a = a+1;
end
endmodule
