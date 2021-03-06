module ALU_8func_selfmade(out,a,b,s);
  
  input [2:0] s;
  input [3:0] a,b;
  output reg [4:0] out;
  
  always @(*)
  case(s)
    3'b000 : out = a;
    3'b001 : out = a + b;
    3'b010 : out = a - b;
    3'b011 : out = a/b;
    3'b100 : out = a%b;
    3'b101 : out = a<<1;
    3'b110 : out = a>>1; 
    3'b111 : out = a>b;
    default:$display("[NG]s = %b Invalid control signal!",s); 
  endcase
endmodule
  
module stimulus7_12;
  
  reg [3:0] a,b;
  reg [2:0] s;
  wire [4:0] out;
  ALU_8func_selfmade mALU(out,a,b,s);
  
  initial begin 
    
    #25 s = 3'b000;  
    #25 s = 3'b001; 
    #25 s = 3'b010; 
    #25 s = 3'b011; 
    #25 s = 3'b100; 
    #25 s = 3'b101; 
    #25 s = 3'b110; 
    #25 s = 3'b111; 
    #5 $stop; 
  end
  
  always @(s) begin
    #1 a <= 0;
       b <= 0;
       $display("s = %b;a = %b; b = %b ; out = %b",s,a,b,out);
       
    #5 a <= 1;
       b <= 0;
       $display("s = %b;a = %b; b = %b ; out = %b",s,a,b,out);       
       
    #5 a <= 1;
       b <= 1;
       $display("s = %b;a = %b; b = %b ; out = %b",s,a,b,out);
              
    #5 a <= 0;
       b <= 1;                                  
       $display("s = %b;a = %b; b = %b ; out = %b",s,a,b,out);       
  end
endmodule  
  
