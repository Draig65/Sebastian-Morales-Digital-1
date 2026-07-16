`timescale 1ns / 1ps

module Corr_acb_TB;
  reg         clk;
  reg         rst;
  reg  [15:0] in_B;
  reg  [15:0] ac_sub;
  reg         shift;
  reg         load;
  reg         load_ac;
  wire [31:0] s_acb;

  Corrimiento_acb uut (.clk(clk),.rst(rst),.in_B(in_B),.ac_sub(ac_sub),.shift(shift),.load(load),.load_ac(load_ac),.s_acb(s_acb));

  always #5 clk = ~clk;

  task check_result;
    input [31:0] expected;
    begin
      #1;
      if (s_acb !== expected) begin
        $display("Corr_acb_TB FAIL: esperado=%h obtenido=%h", expected, s_acb);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_acb_TB.vcd");
    $dumpvars(0, Corr_acb_TB);

    clk     = 0;
    rst     = 1;
    in_B    = 0;
    ac_sub  = 0;
    shift   = 0;
    load    = 0;
    load_ac = 0;

    @(posedge clk);
    check_result(32'd0);

    @(negedge clk);
    rst  = 0;
    load = 1;
    in_B = 16'h1234;
    @(posedge clk);
    check_result(32'h0000_1234);

    @(negedge clk);
    load  = 0;
    shift = 1;
    @(posedge clk);
    check_result(32'h0000_2468);

    @(negedge clk);
    shift   = 0;
    load_ac = 1;
    ac_sub  = 16'habcd;
    @(posedge clk);
    check_result(32'habcd_2468);

    @(negedge clk);
    shift   = 1;
    load_ac = 1;
    ac_sub  = 16'h0fed;
    @(posedge clk);
    check_result(32'h0fed_48d0);

    @(negedge clk);
    load    = 1;
    in_B    = 16'h55aa;
    ac_sub  = 16'hffff;
    @(posedge clk);
    check_result(32'h0000_55aa);

    @(negedge clk);
    rst     = 1;
    load    = 0;
    shift   = 0;
    load_ac = 0;
    @(posedge clk);
    check_result(32'd0);

    $display("Corr_acb_TB PASS");
    $finish;
  end
endmodule
