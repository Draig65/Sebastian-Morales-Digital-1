module sum_r (clk, load, inc, r, rst);
  input  clk;
  input  load, rst;
  input  inc;
  output reg [4:0] r;

  always @(posedge clk) begin
    if (rst || load)
      r <= 5'd0;
    else if (inc)
      r <= r + 1'b1;
  end
endmodule
