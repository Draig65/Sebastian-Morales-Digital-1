`timescale 1ns / 1ps

module Corr_de_TB;
  reg         rst;
  reg         clk;
  reg         shift;
  reg         load;
  reg  [15:0] a;
  wire [31:0] out_a;

  Corrimiento_de uut (.rst(rst),.clk(clk),.shift(shift),.load(load),.a(a),.out_a(out_a));

  always #5 clk = ~clk;

  task check_result;
    input [31:0] expected;
    begin
      #1;
      if (out_a !== expected) begin
        $display("Corr_de_TB FAIL: esperado=%h obtenido=%h", expected, out_a);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_de_TB.vcd");
    $dumpvars(0, Corr_de_TB);

    clk   = 0;
    rst   = 1;
    shift = 0;
    load  = 0;
    a     = 0;

    @(posedge clk);
    check_result(32'd0);

    @(negedge clk);
    rst  = 0;
    load = 1;
    a    = 16'h8001;
    @(posedge clk);
    check_result(32'h0000_8001);

    @(negedge clk);
    load  = 0;
    shift = 1;
    @(posedge clk);
    check_result(32'h0000_4000);

    @(posedge clk);
    check_result(32'h0000_2000);

    @(negedge clk);
    shift = 0;
    @(posedge clk);
    check_result(32'h0000_2000);

    @(negedge clk);
    load  = 1;
    shift = 1;
    a     = 16'hffff;
    @(posedge clk);
    check_result(32'h0000_ffff);

    @(negedge clk);
    rst  = 1;
    load = 0;
    @(posedge clk);
    check_result(32'd0);

    $display("Corr_de_TB PASS");
    $finish;
  end
endmodule
