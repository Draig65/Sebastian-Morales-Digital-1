`timescale 1ns / 1ps

module Corr_c_TB;
  reg clk;
  reg        rst;
  reg        load_b;
  reg  [4:0] B;
  reg        calc_c;
  wire [7:0] C;

  Corrimiento_c uut (.clk(clk),.rst(rst),.load_b(load_b),.B(B),.calc_c(calc_c),.C(C));

  always #5 clk = ~clk;

  task check_result;
    input [7:0] expected;
    begin
      #1;
      if (C !== expected) begin
        $display("Corr_c_TB FAIL: esperado=%0d obtenido=%0d", expected, C);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_c_TB.vcd");
    $dumpvars(0, Corr_c_TB);

    clk    = 0;
    rst    = 1;
    load_b = 0;
    B      = 0;
    calc_c = 0;

    #1;
    check_result(8'd0);

    @(negedge clk);
    rst    = 0;
    load_b = 1;
    B      = 5'd4;
    @(posedge clk);
    check_result(8'd4);

    @(negedge clk);
    load_b = 0;
    calc_c = 1;
    @(posedge clk);
    check_result(8'd17);

    @(posedge clk);
    check_result(8'd69);

    @(negedge clk);
    load_b = 1;
    B      = 5'd31;
    @(posedge clk);
    check_result(8'd31);

    @(negedge clk);
    rst    = 1;
    load_b = 0;
    calc_c = 0;
    #1;
    check_result(8'd0);

    $display("Corr_c_TB PASS");
    $finish;
  end
endmodule
