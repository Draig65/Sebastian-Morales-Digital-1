module Corrimiento_iz(rst,clk,shift,load,b,out_b);
  input rst;
  input clk;
  input shift;
  input load;
  input [15:0] b;
  output reg [31:0] out_b;

  always@(posedge clk) 
    if(rst)
        out_b = 0 ;
    else
      begin
        if (load)
          out_b={16'b0, b};
        else if (shift)
          out_b= out_b<<1;
    end 
endmodule 
