`timescale 1ns / 1ps

module Corr_c_TB;
  reg        clk, rst, load_b, calc_c;
  reg  [4:0] B;
  wire [7:0] C;

  parameter PERIOD = 20;
  reg_c uut (.clk(clk), .rst(rst), .load_b(load_b), .B(B), .calc_c(calc_c), .C(C));

  event reset_trigger, reset_done_trigger;
  initial begin 
    forever begin 
      @ (reset_trigger); @ (negedge clk); rst = 1;
      @ (negedge clk); rst = 0; -> reset_done_trigger;
    end
  end

  initial begin clk = 0; rst = 1; load_b = 0; calc_c = 0; B = 5'd4; end
  initial forever begin clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2); end

  initial begin 
    #10 -> reset_trigger; @ (reset_done_trigger);
    
    // 1. Cargar C con el valor de B (C = B)
    @ (posedge clk); load_b = 1;
    @ (posedge clk); load_b = 0;
    $display("C = B (Esperado C=4): C = %d", C);

    // 2. Calcular C << 2 y C_0 = 1 -> (4 << 2) | 1 = 16 + 1 = 17
    @ (posedge clk); calc_c = 1;
    @ (posedge clk); calc_c = 0;
    #5;
    $display("C = (C<<2)|1 (Esperado C=17): C = %d", C);
    
    #20; $finish;
  end     

  initial begin: TEST_CASE
    $dumpfile("Corr_c_TB.vcd"); $dumpvars(-1, uut);
  end
endmodule
