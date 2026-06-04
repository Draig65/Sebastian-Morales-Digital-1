module Corrimiento_acb (clk, rst, in_B, ac_sub, shift, load, load_ac, s_acb);
  input        clk;
  input        rst;
  input  [15:0] in_B;     
  input  [15:0] ac_sub;   
  input        shift;    
  input        load;      
  input        load_ac;   
  output reg [31:0] s_acb;
  
  always @(negedge clk) begin
    if (rst)
      s_acb <= 32'b0;                       
    else if (load)
      s_acb =< {16'b0, in_B};              
    else begin
      if (shift)   s_acb <= s_acb << 1;     
      if (load_ac) s_acb[31:16] <= ac_sub;  
    end
  end
endmodule
