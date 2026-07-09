module Corr_b (clk, rst, in_B, shift, load, out_B, b0);
  input        clk;
input        rst;
  input  [15:0] in_B;      
  input        shift;      
  input     load;       
  output reg [15:0] out_B;   
  output wire       b0;    
  assign b0 = out_B[0];
always @(posedge clk) begin
    if (rst)
        out_B<= 16'b0;
    else if (load)
      out_B <= in_B;
  else if (shift)
     out_B<= out_B>> 1;
end
endmodule
