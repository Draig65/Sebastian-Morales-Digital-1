module Corrimiento_de(rst,clk,shift,load,a,out_a);
  
  input rst;  
  input clk,
  input shift,
  input load,
  input [7:0] a,
  output reg [31:0] out_a

  always@(posedge clk)    
    if(rst)
        a_out = 0 ;
    else
    begin
      if (load)
        out_a=a;
        else if (shift)
          out_a= a>>1;
    end 
endmodule 
