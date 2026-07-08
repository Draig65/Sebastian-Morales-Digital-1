module paridad (clk, rst, start, B, par, done);
  input        clk, rst, start;
  input  [15:0] B;
 output         par;  
  output        done;  
wire w_shift, w_load, w_inc, w_dec;
  wire w_z_co;
  wire [4:0] w_r;
  wire [15:0] w_out_b;
  wire        w_b0;

  Corr_b Corr_b (.clk  (clk), .rst(rst), .in_B(B),.shift(w_shift), .load(w_load),.out_b(w_out_b),.b0(w_b0));
  cont   cont (.clk(clk), .rst(rst),.load(w_load), .dec(w_dec),.z_co(w_z_co));
  sum_r sum_r (.clk(clk), .rst(w_load), .inc(w_inc),.r(w_r));
  control control (.clk(clk), .rst(rst), .start(start),.b0(w_b0), .z_co(w_z_co),.done(done), .shift(w_shift),.load(w_load), .inc(w_inc),.dec(w_dec));
  assign par = ~w_r[0];
endmodule
