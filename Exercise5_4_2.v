module my_xor(xor_out,xor_in1,xor_in2);

  input xor_in1,xor_in2;
  output xor_out;
  wire or_in1,or_in2,nxor_in1,nxor_in2;

  my_or or1(xor_out,or_in1,or_in2); 
  nand na1(nxor_in1,xor_in1,xor_in1);
  nand na2(nxor_in2,xor_in2,xor_in2);
  my_and a1(or_in1,xor_in1,nxor_in2);
  my_and a2(or_in2,xor_in2,nxor_in1);
  
endmodule

module stimulus5_1;
  
  reg in1,in2;
  wire out_xor;
  wire out_xor_sys;
  reg [2:0] counter;  
  
  my_xor myxor(out_xor,in1,in2);
  xor or_sys(out_xor_sys,in1,in2);
  
  initial
  begin
    counter = 1'd0;
    in1 <= 1'b0;
    in2 <= 1'b0;
    
    #5 in1 = 1'b1;
    counter = counter+1;
    
    #5 in2 = 1'b1;
    counter = counter+1;
    
    #5 in1 = 1'b0;
    counter = counter+1;
    
    #20 $finish;
  end
  
  always@(in1 or in2)
    begin           
      if (out_xor==out_xor_sys)
        $display("PASS my_or function test %d\n",counter); 
      else
        begin
        $display("[NG] my_or function test %d\n",counter);
        $display(" in1 = %b ; in2 = %b ; out_or = %b ; out_or_sys = %b \n",in1,in2,out_xor,out_xor_sys);
        end
    end
    
endmodule