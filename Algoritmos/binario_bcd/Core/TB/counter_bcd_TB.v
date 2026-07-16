`timescale 1ns / 1ps

module counter_bcd_TB;
  reg clk;
  reg rst;
  reg load;
  reg dec;
  wire [3:0] count;
  wire z;

  counter_bcd uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .dec(dec),
    .count(count),
    .z(z)
  );

  always #10 clk = ~clk; // Periodo de 20ns

  initial begin
    $dumpfile("TB/counter_bcd_TB.vcd");
    $dumpvars(0, counter_bcd_TB);

    clk = 0; rst = 1; load = 0; dec = 0;
    #20 rst = 0;

    // 1. Probar carga inicial (debe ir a 8)
    load = 1; #20 load = 0;
    if (count !== 4'd8 || z !== 1'b0) begin
      $display("counter_bcd_TB FAIL en carga inicial"); $fatal(1);
    end

    // 2. Probar decremento hasta cero
    dec = 1;
    repeat(8) @(negedge clk);
    dec = 0;

    if (count !== 4'd0 || z !== 1'b1) begin
      $display("counter_bcd_TB FAIL: No alcanzó el cero correctamente. count=%d, z=%b", count, z);
      $fatal(1);
    end

    $display("counter_bcd_TB PASS");
    $finish;
  end
endmodule