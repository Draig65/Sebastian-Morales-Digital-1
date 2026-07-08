module sum_r(clk, rst, inc, r);
  input  clk;
  input  rst;           
  input   inc;           
  output reg [4:0] r;   
always @(posedge clk) begin
    if (rst)
      r <= 5'd0;
    else if (inc)
      r <= r + 1'b1;
  end
endmodule
