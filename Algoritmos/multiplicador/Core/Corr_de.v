module Corrimiento_de(rst,clk,shift,load,a,out_a);
  
  input rst;  
  input clk;
  input shift;
  input load;
  input [15:0] a;
  output reg [31:0] out_a;

  always@(posedge clk)    
    if(rst)
        out_a = 0 ;
    else
    begin
      if (load)
        out_a={16'b0, a};
        else if (shift)
          out_a= out_a>>1;
    end 
endmodule 
