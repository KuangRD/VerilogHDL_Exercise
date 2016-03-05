module sub_full(x,y,z,D,B);
  
  input x,y,z;
  output D,B;
  
  assign D = ((~x)&(~y)&(z))|((~x)&y&(~z))|((x)&(~y)&(~z))|(x&y&z);
  assign B = ((~x)&y)|((~x)&(z))|(y&z);
  
endmodule

module stimulus7_1;
  
  reg x,y,z;
  reg [2:0] counter; 
  
  sub_full sf(x,y,z,D,B);
  
  initial
  begin
    counter = 1'd0;
    x <= 1'b0;
    y <= 1'b0;
    z <= 1'b0;
    
    #5 z = 1'b1;
    counter = counter+1;
    
    #5 y <= 1'b1;
       z <= 1'b0;
    counter = counter+1;
    
    #5 z = 1'b1;
    counter = counter+1;
    
    #5 x <= 1'b1;
       y <= 1'b0;
       z <= 1'b0;
    counter = counter+1;
    
    #5 x <= 1'b1;
       y <= 1'b0;
       z <= 1'b1;
    counter = counter+1;
    
    #5 x <= 1'b1;
       y <= 1'b1;
       z <= 1'b0;
    counter = counter+1;
    
    #5 x <= 1'b1;
       y <= 1'b1;
       z <= 1'b1;
    counter = counter+1;
    
    //#20 $finish;
  end
  
  always@(x,y,z)
   begin
  $display("x = %b;y = %b;z = %b;B = %b;D = %b",x,y,z,B,D);
  
  end
endmodule