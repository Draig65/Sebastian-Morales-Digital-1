module corrimiento_r (clk, rst, shift, load, r0, s_r);
  input        clk;
  input        rst;
  input        shift;
  input        load;
  input        r0;
  output reg [15:0] s_r;
 
  always @(negedge clk) begin
    if (rst)
      s_r <= 16'b0;
    else if (load)
      s_r <= 16'b0;
    else begin
      if (shift) s_r <= s_r << 1;
      else if (r0)    s_r[0] <= 1'b1;
    end
  end
endmodule
