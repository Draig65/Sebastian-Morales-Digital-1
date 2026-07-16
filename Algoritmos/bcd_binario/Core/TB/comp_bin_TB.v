`timescale 1ns / 1ps

module comp_bin_TB;
  reg  [3:0] nibble_in;
  wire [3:0] nibble_out;

  // Instancia del comparador para BCD-to-Bin
  comp_bin uut (
    .nibble_in(nibble_in),
    .nibble_out(nibble_out)
  );

  task check_result;
    input [3:0] expected;
    begin
      #1;
      if (nibble_out !== expected) begin
        $display("comp_bin_TB FAIL: Entrada BCD=%d Esperado=%d Obtenido=%d", nibble_in, expected, nibble_out);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/comp_bin_TB.vcd");
    $dumpvars(0, comp_bin_TB);

    // Valores menores a 8 (no deben sufrir cambios)
    nibble_in = 4'd0; check_result(4'd0);
    nibble_in = 4'd4; check_result(4'd4);
    nibble_in = 4'd7; check_result(4'd7);

    // Valores mayores o iguales a 8 (se les resta 3)
    nibble_in = 4'd8; check_result(4'd5);
    nibble_in = 4'd9; check_result(4'd6);
    nibble_in = 4'd10; check_result(4'd7);

    $display("comp_bin_TB PASS");
    $finish;
  end
endmodule