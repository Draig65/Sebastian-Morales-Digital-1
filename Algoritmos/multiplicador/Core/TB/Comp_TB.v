`timescale 1ns / 1ps

module Comp_TB;
  reg  [31:0] a;
  reg         rst;
  wire        z;

  comparador uut (.rst(rst), .a(a),.z(z));

  task check_result;
    input expected;
    begin
      #1;
      if (z !== expected) begin
        $display("Comp_TB FAIL: rst=%b a=%h esperado=%b obtenido=%b", rst, a, expected, z);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Comp_TB.vcd");
    $dumpvars(0, Comp_TB);

    rst = 1;
    a   = 32'd0;
    check_result(1'b0);

    a = 32'hffff_ffff;
    check_result(1'b0);

    rst = 0;
    a   = 32'd0;
    check_result(1'b1);

    a = 32'd1;
    check_result(1'b0);

    a = 32'h8000_0000;
    check_result(1'b0);

    $display("Comp_TB PASS");
    $finish;
  end
endmodule
