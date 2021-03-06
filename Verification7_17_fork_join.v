module stimulus7_17;
  reg x,y;
  reg a,b,p,m;
  initial begin
    x = 1'b0;
    $display($time," x = 1'b0;");
    #5 y = 1'b1;
    $display($time," #5 y = 1'b1;");
    
    fork
      #20 a = x;
      #20 $display($time," #20 a = x;");
      #15 b = y;
      #15 $display($time," #15 b = y;");
    join
    
    #40 x = 1'b1; 
    $display($time," #40 x = 1'b1; ");
    
    fork 
      #10 p = x;
      #10 $display($time," #10 p = x;");
      begin
        #10 a = y;
        $display($time," #10 a = y;");
        #30 b = 0;
        $display($time," #30 b = x;");
      end
      #5 m = y;
      #10 $display($time," #5 m = y;");
    join
  end
  
  initial 
   $monitor($time,"x = %b,y = %b,a = %b,b = %b,p = %b,m = %b",x,y,a,b,p,m);
 
endmodule
