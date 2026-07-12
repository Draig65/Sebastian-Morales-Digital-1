`timescale 1ns / 1ps

module Corr_b_TB;
  reg   clk, rst, shift, set_b0;
  wire [4:0] B;

  parameter PERIOD = 20;
  Corr_b uut (.clk(clk), .rst(rst), .shift(shift), .set_b0(set_b0), .B(B));

  event reset_trigger, reset_done_trigger;
  initial begin 
    forever begin 
      @ (reset_trigger); @ (negedge clk); rst = 1;
      @ (negedge clk); rst = 0; -> reset_done_trigger;
    end
  end

  initial begin clk = 0; rst = 1; shift = 0; set_b0 = 0; end
  initial forever begin clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2); end

  initial begin 
    #10 -> reset_trigger; @ (reset_done_trigger);
    
    // Desplazar y activar bit 0
    @ (posedge clk); shift = 1; set_b0 = 1;
    @ (posedge clk); shift = 0; set_b0 = 0;
    $display("Paso 1 (Esperado B=1): B = %d", B);

    @ (posedge clk); shift = 1; // Desplaza (B se vuelve 2)
    @ (posedge clk); shift = 0;
    $display("Paso 2 (Esperado B=2): B = %d", B);

    @ (posedge clk); set_b0 = 1; // Pone B[0] en 1 (B se vuelve 3)
    @ (posedge clk); set_b0 = 0;
    #5;
    $display("Paso 3 (Esperado B=3): B = %d", B);
    
    #20; $finish;
  end     

  initial begin: TEST_CASE
    $dumpfile("Corr_b_TB.vcd"); $dumpvars(-1, uut);
  end
endmodule

