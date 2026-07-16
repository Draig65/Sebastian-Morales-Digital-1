`timescale 1ns / 1ps

module Acc_TB;
  reg rst;
  reg clk;
  reg  [31:0] b;
  reg add;
  reg load;
  wire [31:0] out_r;

  acumulador uut (.rst(rst),.clk(clk),.b(b),.add(add),.out_r(out_r),.load(load));

  always #5 clk = ~clk;

  task check_result;
    input [31:0] expected;
    begin
      #1;
      if (out_r !== expected) begin
        $display("Acc_TB FAIL: esperado=%h obtenido=%h", expected, out_r);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Acc_TB.vcd");
    $dumpvars(0, Acc_TB);

    clk  = 0;
    rst  = 1;
    b    = 0;
    add  = 0;
    load = 0;

    #1;
    check_result(32'd0);

    @(negedge clk);
    rst  = 0;
    b    = 32'd25;
    add  = 1;
    load = 1;
    @(posedge clk);
    check_result(32'd0);

    @(negedge clk);
    load = 0;
    b    = 32'd5;
    @(posedge clk);
    check_result(32'd5);

    @(negedge clk);
    b = 32'd7;
    @(posedge clk);
    check_result(32'd12);

    @(negedge clk);
    add = 0;
    b   = 32'd100;
    @(posedge clk);
    check_result(32'd12);

    @(negedge clk);
    add  = 1;
    load = 1;
    @(posedge clk);
    check_result(32'd0);

    @(negedge clk);
    load = 0;
    add  = 1;
    b    = 32'hffff_ffff;
    @(posedge clk);
    check_result(32'hffff_ffff);

    #2 rst = 1;
    check_result(32'd0);

    $display("Acc_TB PASS");
    $finish;
  end
endmodule
