module mux4_to_1(out,i0,i1,i2,i3,s1,s0);
  
  input [2:0] i0,i1,i2,i3;
  input s0,s1;
  output  out;
  reg [2:0] out;
  
  always @(i0 or i1 or i2 or i3 or s1 or s0)
  begin
    
    if({s1,s0} == 2'd0) out = i0;
    else if({s1,s0} == 2'd1)  out = i1;
    else if({s1,s0} == 2'd2)  out = i2;
    else if({s1,s0} == 2'd3)  out = i3;
    else $display("[NG] s1 = %b,s0 = %b Invalid Control Signal!!!",s1,s0);
  end

endmodule

module stimulus7_10;
  
  reg [2:0] i0,i1,i2,i3;
  reg s1,s0;
  wire [2:0] out;
  mux4_to_1 my4in1(out,i0,i1,i2,i3,s1,s0);
  
  initial
  begin
  
    i0 <= 1;
    i1 <= 2;
    i2 <= 3;
    i3 <= 4;  
    
  end 
  
  initial
  begin
    
    #1  s1 <= 0;s0 <= 0;
    #5  s1 <= 0;s0 <= 1;
    #5  s1 <= 1;s0 <= 0;
    #5  s1 <= 1;s0 <= 1;
    #10 $stop;      
    
  end

always @(out)
  $display(" { s1 , s0} = %d, out = %d",{s1,s0},out);

endmodule

