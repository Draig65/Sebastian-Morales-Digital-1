module Corrimiento_iz(rst,clk,shift,load,b,out_b);
  input rst;
  input clk;
  input shift;
  input load;
  input [7:0] b;
  output reg [31:0] out_b;

  always@(posedge clk) 
    if(rst)
        b_out = 0 ;
    else
      begin
        if (load)
          out_b=b;
        else(shift)
          out_b= b<<1;
    end 
endmodule 
