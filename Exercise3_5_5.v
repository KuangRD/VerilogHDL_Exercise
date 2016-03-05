module Stimulus3_5;
  `define MEM_SIZE 1024

  reg [3:0] latch;
  reg [2:0] in_reg;

  
  initial 
  begin
    in_reg = 3'd2;
  //5.1  
  latch = 4'd12;
  $display("The current value of latch = %b\n", latch);

  //5.2
  in_reg = 3'd2;
  $monitor($time,"In regeister value = %b\n",in_reg[2:0]);
  
  //5.3
  $display("The maximum memory size is %h",`MEM_SIZE);

  end
 endmodule