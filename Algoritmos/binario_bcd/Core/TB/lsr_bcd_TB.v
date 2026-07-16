`timescale 1ns / 1ps

module lsr_bcd_TB;
  reg clk;
  reg rst;
  reg load;
  reg shift;
  reg ld_acc;
  reg [7:0] in_data;
  reg [3:0] add_high;
  reg [3:0] add_low;
  wire [15:0] r0;
  wire [7:0] result;

  // Instancia coincidiendo exactamente con los puertos de lsr_bcd.v
  lsr_bcd uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .shift(shift),
    .ld_acc(ld_acc),
    .in_data(in_data),
    .add_high(add_high),
    .add_low(add_low),
    .r0(r0),
    .result(result)
  );

  always #10 clk = ~clk; // Periodo de 20ns

  initial begin
    $dumpfile("TB/lsr_bcd_TB.vcd");
    $dumpvars(0, lsr_bcd_TB);

    clk = 0; rst = 1; load = 0; shift = 0; ld_acc = 0;
    in_data = 8'hA5; // 10100101 en binario
    add_high = 0; add_low = 0;
    #20 rst = 0;

    // 1. Probar carga de dato (load = 1) -> r0 debe ser {8'h00, 8'hA5} = 16'h00A5
    load = 1; #20 load = 0;
    if (r0[7:0] !== 8'hA5) begin
      $display("lsr_bcd_TB FAIL en carga de dato. Obtenido: %h", r0); $fatal(1);
    end

    // 2. Probar desplazamiento a la izquierda (shift = 1) -> 16'h00A5 << 1 = 16'h014A
    shift = 1; #20 shift = 0;
    if (r0 !== 16'h014A) begin
      $display("lsr_bcd_TB FAIL en desplazamiento. Obtenido: %h", r0); $fatal(1);
    end

    // 3. Probar carga del acumulador BCD (ld_acc = 1) -> sobreescribe r0[15:8] con {add_high, add_low}
    add_high = 4'd8; add_low = 4'd3;
    ld_acc = 1; #20 ld_acc = 0;
    // r0 debe ser {4'd8, 4'd3, 8'h4A} = 16'h834A -> result toma r0[15:8] = 8'h83
    if (result !== 8'h83 || r0 !== 16'h834A) begin
      $display("lsr_bcd_TB FAIL en carga de nibbles BCD. Obtenido: result=%h, r0=%h", result, r0); $fatal(1);
    end

    $display("lsr_bcd_TB PASS");
    $finish;
  end
endmodule