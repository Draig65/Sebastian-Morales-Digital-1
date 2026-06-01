`timescale 1ns / 1ps

module corr_ra_TB;
  reg        clk, rst, load, shift, sub_en;
  reg  [7:0] radical_in;
  reg  [7:0] C;
  wire [7:0] A, R;

  reg [20:0] i;
  parameter PERIOD = 20;

  corr_ra uut (
    .clk(clk), .rst(rst), .load(load),.radical_in(radical_in), 
    .shift(shift), .sub_en(sub_en), .C(C), .A(A), .R(R)
  );

  event reset_trigger, reset_done_trigger;

  initial begin 
    forever begin 
      @ (reset_trigger); @ (negedge clk); rst = 1;
      @ (negedge clk); rst = 0; -> reset_done_trigger;
    end
  end

  initial begin  
    clk = 0; rst = 1; load = 0; shift = 0; sub_en = 0;
    radical_in = 8'hA5; C = 8'd10; // 8'hA5 = 10100101
  end

  initial forever begin
    clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2);
  end

  initial begin 
    #10 -> reset_trigger; @ (reset_done_trigger);
    
    // 1. Cargar el Radical
    @ (posedge clk); load = 1;
    @ (posedge clk); load = 0;
    $display("Carga inicial: R=%b, A=%b", R, A);

    // 2. Probar desplazamiento {R,A} << 2
    @ (posedge clk); shift = 1;
    @ (posedge clk); shift = 0;
    $display("Luego de Shift: R=%b, A=%b", R, A);

    // 3. Probar resta R = R - C
    @ (posedge clk); sub_en = 1;
    @ (posedge clk); sub_en = 0;
    #5;
    $display("Luego de Resta (-10): R=%d, A=%b", R, A);
    
    #20; $finish;
  end     

  initial begin: TEST_CASE
    $dumpfile("corr_ra_TB.vcd"); $dumpvars(-1, uut);
  end
endmodule
