`timescale 1ns / 1ps

module res_TB;
  reg  [15:0] Ac;
  reg  [15:0] A;
  wire [15:0] ac_out;

  resta_ac uut (.Ac(Ac),.A(A),.ac_out(ac_out) );

  task check_result;
    input [15:0] expected;
    begin
      #1;
      if (ac_out !== expected) begin
        $display("res_TB FAIL: Ac=%h A=%h esperado=%h obtenido=%h",
                 Ac, A, expected, ac_out);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/res_TB.vcd");
    $dumpvars(0, res_TB);

    Ac = 16'd50;
    A  = 16'd20;
    check_result(16'd30);

    Ac = 16'd20;
    A  = 16'd20;
    check_result(16'd0);

    Ac = 16'd0;
    A  = 16'd1;
    check_result(16'hffff);

    Ac = 16'hffff;
    A  = 16'hfffe;
    check_result(16'd1);

    $display("res_TB PASS");
    $finish;
  end
endmodule
