module Corrimiento_iz(
  input clk,
  input shift,
  input load,
  input [7:0] b,
  output reg [31:0] out_b);

  always@(posedge clk) 
    begin
      if (load)
        out_b=b;
        else if (shift)
          out_b= b<<1;
    end 
endmodule 
