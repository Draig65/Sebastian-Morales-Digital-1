`timescale 1ns / 1ps

module Comp_aca_TB;
  reg  [15:0] Ac;
  reg  [15:0] A;
  wire z;

  comparador_aca uut (.Ac(Ac),.A(A),.z(z) );

  task check_result;
    input expected;
    begin
      #1;
      if (z !== expected) begin
        $display("Comp_aca_TB FAIL: Ac=%0d A=%0d esperado=%b obtenido=%b",
                 Ac, A, expected, z);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Comp_aca_TB.vcd");
    $dumpvars(0, Comp_aca_TB);

    Ac = 16'd10;
    A  = 16'd20;
    check_result(1'b0);

    Ac = 16'd35;
    A  = 16'd15;
    check_result(1'b1);

    Ac = 16'd50;
    A  = 16'd50;
    check_result(1'b1);

    Ac = 16'd0;
    A  = 16'd0;
    check_result(1'b1);

    Ac = 16'hffff;
    A  = 16'hfffe;
    check_result(1'b1);

    $display("Comp_aca_TB PASS");
    $finish;
  end
endmodule
