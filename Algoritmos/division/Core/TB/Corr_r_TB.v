`timescale 1ns / 1ps

module Corr_r_TB;
  reg clk;
  reg rst;
  reg shift;
  reg load;
  reg r0;
  wire [15:0] s_r;

  corrimiento_r uut (.clk(clk),.rst(rst),.shift(shift),.load(load),.r0(r0),.s_r(s_r));

  always #5 clk = ~clk;

  task check_result;
    input [15:0] expected;
    begin
      #1;
      if (s_r !== expected) begin
        $display("Corr_r_TB FAIL: esperado=%h obtenido=%h", expected, s_r);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_r_TB.vcd");
    $dumpvars(0, Corr_r_TB);

    clk   = 0;
    rst   = 1;
    shift = 0;
    load  = 0;
    r0    = 0;

    @(negedge clk);
    check_result(16'd0);

    @(posedge clk);
    rst  = 0;
    load = 1;
    @(negedge clk);
    check_result(16'd0);

    @(posedge clk);
    load = 0;
    r0   = 1;
    @(negedge clk);
    check_result(16'd1);

    @(posedge clk);
    r0    = 0;
    shift = 1;
    @(negedge clk);
    check_result(16'd2);

    @(posedge clk);
    r0 = 1;
    @(negedge clk);
    check_result(16'd4);

    @(posedge clk);
    shift = 0;
    @(negedge clk);
    check_result(16'd5);

    @(posedge clk);
    rst = 1;
    r0  = 0;
    @(negedge clk);
    check_result(16'd0);

    $display("Corr_r_TB PASS");
    $finish;
  end
endmodule
