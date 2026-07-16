`timescale 1ns / 1ps

module comp_bcd_TB;
  reg  [3:0] nibble_in;
  wire [3:0] nibble_out;


  comp_bcd uut (
    .nibble_in(nibble_in),
    .nibble_out(nibble_out)
  );

  task check_result;
    input [3:0] expected;
    begin
      #1;
      if (nibble_out !== expected) begin
        $display("comp_bcd_TB FAIL: Entrada=%d Esperado=%d Obtenido=%d", nibble_in, expected, nibble_out);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/comp_bcd_TB.vcd");
    $dumpvars(0, comp_bcd_TB);

  
    nibble_in = 4'd0; check_result(4'd0);
    nibble_in = 4'd3; check_result(4'd3);
    nibble_in = 4'd4; check_result(4'd4);

   
    nibble_in = 4'd5; check_result(4'd8);
    nibble_in = 4'd7; check_result(4'd10);
    nibble_in = 4'd9; check_result(4'd12);

    $display("comp_bcd_TB PASS");
    $finish;
  end
endmodule