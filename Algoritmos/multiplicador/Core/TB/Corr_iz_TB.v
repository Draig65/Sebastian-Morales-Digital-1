`timescale 1ns / 1ps

module Corr_iz_TB;
  reg         rst;
  reg         clk;
  reg         shift;
  reg         load;
  reg  [15:0] b;
  wire [31:0] out_b;

  Corrimiento_iz uut (.rst(rst),.clk(clk),.shift(shift),.load(load),.b(b),.out_b(out_b));

  always #5 clk = ~clk;

  task check_result;
    input [31:0] expected;
    begin
      #1;
      if (out_b !== expected) begin
        $display("Corr_iz_TB FAIL: esperado=%h obtenido=%h", expected, out_b);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_iz_TB.vcd");
    $dumpvars(0, Corr_iz_TB);

    clk   = 0;
    rst   = 1;
    shift = 0;
    load  = 0;
    b     = 0;

    @(posedge clk);
    check_result(32'd0);

    @(negedge clk);
    rst  = 0;
    load = 1;
    b    = 16'hffff;
    @(posedge clk);
    check_result(32'h0000_ffff);

    @(negedge clk);
    load  = 0;
    shift = 1;
    @(posedge clk);
    check_result(32'h0001_fffe);

    @(posedge clk);
    check_result(32'h0003_fffc);

    @(negedge clk);
    shift = 0;
    @(posedge clk);
    check_result(32'h0003_fffc);

    @(negedge clk);
    load  = 1;
    shift = 1;
    b     = 16'h8000;
    @(posedge clk);
    check_result(32'h0000_8000);

    @(negedge clk);
    rst  = 1;
    load = 0;
    @(posedge clk);
    check_result(32'd0);

    $display("Corr_iz_TB PASS");
    $finish;
  end
endmodule
