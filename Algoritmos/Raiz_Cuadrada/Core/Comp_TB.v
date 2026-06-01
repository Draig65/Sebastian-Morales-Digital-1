`timescale 1ns / 1ps

module comparador_TB;
  reg  [7:0] R;
  reg  [7:0] C;
  wire       z;

  comparador uut (.R(R), .C(C), .z(z));

  initial begin
    $display("\n=== TESTBENCH: COMPARADOR ===");
    
    // Caso 1: R < C
    R = 8'd10; C = 8'd20;
    #10;
    $display("R=%d, C=%d -> z=%b (Esperado: 0)", R, C, z);

    // Caso 2: R > C
    R = 8'd35; C = 8'd15;
    #10;
    $display("R=%d, C=%d -> z=%b (Esperado: 1)", R, C, z);

    // Caso 3: R == C
    R = 8'd50; C = 8'd50;
    #10;
    $display("R=%d, C=%d -> z=%b (Esperado: 1)", R, C, z);
    
    $display("=============================\n");
    $finish;
  end

  initial begin: TEST_CASE
    $dumpfile("comparador_TB.vcd");
    $dumpvars(-1, uut);
  end
endmodule
