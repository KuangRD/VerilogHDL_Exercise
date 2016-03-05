module signal_generator(sig,enable);
  input enable;
  output  sig;
  reg sig;
//  reg [3:0] counter;
  

    always begin
    //counter = 4'd0;
    #1 sig = 1'b0;
    while (enable == 1'b1) begin
     #10 sig = ~sig;
     $display("in loop");
      //counter = counter + 1;
    end
 end
endmodule
       
module stimulus7_13;
  wire sig;
  reg enable;
  
  signal_generator sg(sig,enable);
  
  initial begin
    enable = 1'b0;
    #5 enable = 1'b1;
    #50 enable = 1'b0;
  end
endmodule
      
    
  
