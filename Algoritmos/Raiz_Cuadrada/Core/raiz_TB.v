`timescale 1ns / 1ps
`define SIMULATION

module Raiz_TB;
  reg        rst;
  reg        clk;
  reg        init;
  reg        start;
  reg  [7:0] radical;
  
  wire [4:0] resultado;
  wire [7:0] residuo;
  wire       done;

  raiz_cuadrada uut ( .clk(clk), .rst(rst), .start(start), .radical(radical), .resultado(resultado), .done(done));

  parameter PERIOD         = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET         = 0;
  reg [20:0] i;

  event reset_trigger;
  event reset_done_trigger;

  initial begin 
    forever begin 
      @ (reset_trigger);
      @ (negedge clk);
      rst = 1;
      @ (negedge clk);
      rst = 0;
      -> reset_done_trigger;
    end
  end

  initial begin  
    clk = 0; rst = 1; init = 0; start = 0;
    radical = 8'd121; 
  end

  initial begin  
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end

  initial begin 
    #10 -> reset_trigger;
    @ (reset_done_trigger);
    
    @ (posedge clk);
    init = 1;
    @ (posedge clk);
    init = 0;
    
    for(i=0; i<2; i=i+1) begin
      @ (posedge clk);
    end
    
    start = 1;
    @ (posedge clk);
    start = 0;
    
  
    @ (posedge done);
    #20;
    $finish;
  end     

  
  always @(posedge done) begin
    $display(" Valor Radical  : %d", radical);
    $display(" RESULTADO FINAL : %d", resultado);
    $display(" RESIDUO FINAL   : %d", residuo);
  end

  initial begin: TEST_CASE
    $dumpfile("Raiz_TB.vcd");

  initial begin: TEST_CASE
    $dumpfile("Raiz_TB.vcd");
    $dumpvars(-1, uut);
  end
endmodule
