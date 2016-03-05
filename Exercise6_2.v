`timescale 1ns/1ns
module magnitude_comparator(A,B,A_gt_B,A_lt_B,A_eq_B);

  input [3:0] A,B;
  output A_gt_B,A_lt_B,A_eq_B;
  wire [3:0] x;
  
//  assign x[0]=((A[0])&(B[0]))||((!A[0])&(!B[0])); 
//  assign x[1]=((A[1])&(B[1]))||((!A[1])&(!B[1])); 
//  assign x[2]=((A[2])&(B[2]))||((!A[2])&(!B[2])); 
//  assign x[3]=((A[3])&(B[3]))||((!A[3])&(!B[3])); 
  
  xnor xn0(x[0],A[0],B[0]);
  xnor xn1(x[1],A[1],B[1]);
  xnor xn2(x[2],A[2],B[2]);
  xnor xn3(x[3],A[3],B[3]);
  

  assign A_gt_B = (A[3]&(!B[3]))||(x[3]&A[2]&(!B[2]))||(x[3]&x[2]&A[1]&(!B[1]))||(x[3]&x[2]&x[1]&A[0]&(!B[0])), 
   A_lt_B = ((!A[3])&B[3])||(x[3]&(!A[2])&B[2])||(x[3]&x[2]&(!A[1])&B[1])||(x[3]&x[2]&x[1]&(!A[0])&B[0]), 
   A_eq_B = x[3]&x[2]&x[1]&x[0];
  
endmodule

module stiumlus6_2;
  reg [3:0] A,B;
  
  magnitude_comparator mc1(A,B,A_gt_B,A_lt_B,A_eq_B);
  
  initial
  begin
 
  A<=0000;B<=0000; 
  #10 A<=0000;B<=1000;
  #10 A<=1000;B<=0000; 

  #10 $stop; 

  end 

  initial 
  $monitor($time,"When A=%b and B=%b,the outputs A_gt_B=%b, A_lt_B%b, A_eq_ B=%b; ", A, B, A_gt_B, A_lt_B, A_eq_B); 

endmodule