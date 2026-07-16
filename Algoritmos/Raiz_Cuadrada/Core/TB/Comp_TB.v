`timescale 1ns / 1ps

module Comp_TB;
  reg  [7:0] R;
  reg  [7:0] C;
  wire       z;

  comparador uut (.R(R), .C(C), .z(z));

  task check_result;
    input expected;
    begin
      #1;
      if (z !== expected) begin
        $display("Comp_TB FAIL: R=%0d C=%0d esperado=%b obtenido=%b", R, C, expected, z);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Comp_TB.vcd");
    $dumpvars(0, Comp_TB);

    R = 8'd10;
    C = 8'd20;
    check_result(1'b0);

    R = 8'd35;
    C = 8'd15;
    check_result(1'b1);

    R = 8'd50;
    C = 8'd50;
    check_result(1'b1);

    R = 8'd0;
    C = 8'd0;
    check_result(1'b1);

    R = 8'hff;
    C = 8'hfe;
    check_result(1'b1);

    $display("Comp_TB PASS");
    $finish;
  end
endmodule
