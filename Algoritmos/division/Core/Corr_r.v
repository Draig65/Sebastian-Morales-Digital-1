module corrimiento_r (clk, init, shift, load, r0, s_r);
  input        clk;
  input        init;
  input        shift;
  input        load;
  input        r0;
  output reg [15:0] s_r;
 
  always @(negedge clk) begin
    if (init)
      s_r = 16'b0;
    else if (load)
      s_r = 16'b0;
    else begin
      if (shift) s_r = s_r << 1;
      else if (r0)    s_r[0] = 1'b1;
    end
  end
endmodule
