module my_or(or_out,or_in1,or_in2);

  input or_in1,or_in2;
  output or_out;
  
  
  //nand na2(n_or_in1,or_in1,or_in1);
  //nand na3(n_or_in2,or_in2,or_in2);
  nand na1(or_out,~or_in1,~or_in2);

  
endmodule

module my_and(and_out,and_in1,and_in2);
  
  input and_in1,and_in2;
  output and_out;
  wire nandin1,nandin2,nout;
  
  nand na1(and_out,nout,nout);
  nand na2(nandin1,and_in1,and_in1);
  nand na3(nandin2,and_in2,and_in2);
  my_or or1(nout,nandin1,nandin2);

  
endmodule

module my_not(not_out1,not_out2,not_in1,not_in2);
  
  input not_in1,not_in2;
  output not_out1,not_out2;
  
  nand na2(not_out1,not_in1,1);
  nand na3(not_out2,not_in2,1);
  
endmodule

module stimulus5_1;
  
  reg in1,in2;
  wire out_or,out_and,out_not1,out_not2;
  wire out_or_sys,out_and_sys,out_not1_sys,out_not2_sys;
  reg [2:0] counter;  
  
  my_or myor(out_or,in1,in2);
  or or_sys(out_or_sys,in1,in2);
  
  my_and myand(out_and,in1,in2);
  and and_sys(out_and_sys,in1,in2);
  
  my_not mynot1(out_not1,out_not2,in1,in2);
  not not_sys(out_not1_sys,in1);
  not not_sys1(out_not2_sys,in2);
  
  
  
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
      if (out_or==out_or_sys)
        $display("PASS my_or function test %d\n",counter); 
      else
        begin
        $display("[NG] my_or function test %d\n",counter);
        $display(" in1 = %b ; in2 = %b ; out_or = %b ; out_or_sys = %b \n",in1,in2,out_or,out_or_sys);
        end
    end
    
 always@(in1 or in2)
    begin   
      
      if (out_and==out_and_sys)
        $display("PASS my_and function test %d\n",counter); 
      else
        begin
        $display("[NG] my_and function test %d\n",counter);   
        $display(" in1 = %b ; in2 = %b ; out_and = %b ; out_and_sys = %b \n",in1,in2,out_and,out_and_sys);
        end
    end
    
 always@(in1 or in2)
    begin
           
      if (out_not1==out_not1_sys)
        $display("PASS my_not1 function test %d\n",counter); 
      else
        begin
        $display("[NG] my_not1 function test %d\n",counter);
        $display(" in1 = %b ; out_not1 = %b ; out_or_sys = %b \n",in1,out_not1,out_not1_sys);
        end
    end

 always@(in1 or in2)
    begin
          
      if(out_not2==out_not2_sys)
        $display("PASS my_not2 function test %d\n",counter); 
      else
        begin
        $display("[NG] my_not2 function test %d\n",counter);
        $display(" in1 = %b ; out_not1 = %b ; out_or_sys = %b \n",in1,out_not1,out_not1_sys);
        end
    end
          
endmodule