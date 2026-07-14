`timescale 1ns / 1ps

module Corr_b_TB;
  reg   clk, rst, shift, set_b0;
  wire [4:0] B;

  Corr_b uut (.clk(clk), .rst(rst), .shift(shift), .set_b0(set_b0), .B(B));
 always #5 clk = ~clk;

  task check_result;
    input [4:0] expected;
    begin
      #1;
      if (B !== expected) begin
        $display("Corr_b_TB FAIL: esperado=%0d obtenido=%0d", expected, B);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_b_TB.vcd");
    $dumpvars(0, Corr_b_TB);

    clk   = 0;
    start = 0;
    shift = 0;
    b0    = 0;

    #2 start = 1;
    check_result(5'd0);
    #2 start = 0;

    @(negedge clk);
    b0 = 1;
    @(posedge clk);
    check_result(5'd1);

    @(negedge clk);
    shift = 1;
    b0    = 0;
    @(posedge clk);
    check_result(5'd2);

    @(negedge clk);
    shift = 1;
    b0    = 1;
    @(posedge clk);
    check_result(5'd5);

    @(negedge clk);
    shift = 0;
    b0    = 1;
    @(posedge clk);
    check_result(5'd5);

    #2 start = 1;
    check_result(5'd0);

    $display("Corr_b_TB PASS");
    $finish;
  end
endmodule
