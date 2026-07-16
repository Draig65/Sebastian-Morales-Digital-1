`timescale 1ns / 1ps

module rsr_bin_TB;
  reg clk;
  reg rst;
  reg load;
  reg shift;
  reg ld_acc;
  reg [7:0] in_data;
  reg [3:0] sub_high;
  reg [3:0] sub_low;
  wire [15:0] r0;
  wire [7:0] result;

  rsr_bin uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .shift(shift),
    .ld_acc(ld_acc),
    .in_data(in_data),
    .sub_high(sub_high),
    .sub_low(sub_low),
    .r0(r0),
    .result(result)
  );

  always #10 clk = ~clk;

  initial begin
    $dumpfile("TB/rsr_bin_TB.vcd");
    $dumpvars(0, rsr_bin_TB);

    clk = 0; rst = 1; load = 0; shift = 0; ld_acc = 0;
    in_data = 8'h45; 
    sub_high = 0; sub_low = 0;
    #20 rst = 0;

   
    load = 1; #20 load = 0;
    if (r0 !== 16'h4500) begin
      $display("rsr_bin_TB FAIL en Carga: Esperado=16'h4500, Obtenido=%h", r0); $fatal(1);
    end


    shift = 1; #20 shift = 0;
    if (r0 !== 16'h2280) begin
      $display("rsr_bin_TB FAIL en Desplazamiento: Esperado=16'h2280, Obtenido=%h", r0); $fatal(1);
    end

    
    sub_high = 4'd7; sub_low = 4'd2;
    ld_acc = 1; #20 ld_acc = 0;
 
    if (r0 !== 16'h7280 || result !== 8'h80) begin
      $display("rsr_bin_TB FAIL en ld_acc: Esperado r0=16'h7280, Obtenido r0=%h", r0); $fatal(1);
    end

    $display("rsr_bin_TB PASS");
    $finish;
  end
endmodule