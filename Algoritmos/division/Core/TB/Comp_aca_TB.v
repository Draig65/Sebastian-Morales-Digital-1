`timescale 1ns / 1ps

module Comp_aca_TB;
  reg  [15:0] Ac;
  reg  [15:0] A;
  wire       z;

  comparador uut (.Ac(Ac), .A(A), .z(z));

  initial begin
    $display("\n=== TESTBENCH: COMPARADOR ===");
    
    // Caso 1: Ac < A
    Ac = 8'd10; A = 8'd20;
    #10;
    $display("Ac=%d, A=%d -> z=%b (Esperado: 0)", Ac, A, z);

    // Caso 2: Ac > A
    Ac = 8'd35; A = 8'd15;
    #10;
    $display("Ac=%d, A=%d -> z=%b (Esperado: 1)",Ac, A, z);

    // Caso 3: Ac == A
    Ac = 8'd50; A = 8'd50;
    #10;
    $display("Ac=%d, A=%d -> z=%b (Esperado: 1)", Ac, A, z);
    
    $display("=============================\n");
    $finish;
  end

  initial begin: TEST_CASE
    $dumpfile("Comp_aca_TB.vcd");
    $dumpvars(-1, uut);
  end
endmodule
