module bit8_counter;
  reg clk = 1'b0;
  reg [7:0] counter = 5;
  
  initial 
  forever #5 clk = ~clk;
  
  always @(posedge clk)
  begin
    begin: block1
      counter = counter + 1;
    end

    if(counter > 66) 
      begin
        disable block1;
        $display("stop");
        #2 $stop;
      end
  end
  
  initial
  $monitor("counter = %d",counter);

endmodule