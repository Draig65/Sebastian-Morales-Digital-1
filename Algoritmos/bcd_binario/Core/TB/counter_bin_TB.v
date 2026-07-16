`timescale 1ns / 1ps

module counter_bin_TB;
  reg clk;
  reg rst;
  reg load;
  reg dec;
  wire [3:0] count;
  wire z;

  counter_bin uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .dec(dec),
    .count(count),
    .z(z)
  );

  always #10 clk = ~clk; 

  initial begin
    $dumpfile("TB/counter_bin_TB.vcd");
    $dumpvars(0, counter_bin_TB);

    clk = 0; rst = 1; load = 0; dec = 0;
    #20 rst = 0;

    if (count !== 4'd8 || z !== 1'b0) begin
      $display("counter_bin_TB FAIL en inicialización de Reset"); $fatal(1);
    end

  
    dec = 1;
    repeat(8) @(negedge clk);
    dec = 0;

    
    if (count !== 4'd0 || z !== 1'b1) begin
      $display("counter_bin_TB FAIL: El contador no llegó a cero correctamente. count=%d, z=%b", count, z);
      $fatal(1);
    end

   
    load = 1; #20 load = 0;
    if (count !== 4'd8 || z !== 1'b0) begin
      $display("counter_bin_TB FAIL en señal de carga (load)"); $fatal(1);
    end

    $display("counter_bin_TB PASS");
    $finish;
  end
endmodule