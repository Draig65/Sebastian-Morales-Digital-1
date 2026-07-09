`timescale 1ns / 1ps
`define SIMULATION         
module Paridad_TB;
  reg         clk;
  reg         rst;
  reg         init;         
  reg         start;
  reg  [15:0] B;           

  wire        par;          
  wire        done;

  paridad uut (.clk  (clk),.rst  (rst),.start(start),.B    (B),.par  (par),.done (done));

  parameter PERIOD          = 20;  
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET          = 0;

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
    clk = 0;
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD - (PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end

  integer i;
  initial begin
    rst   = 1;
    init  = 0;
    start = 0;
    B     = 16'b0;

    #10 -> reset_trigger;
    @(reset_done_trigger);

    @(posedge clk);                  
      init  = 1;                     
      B     = 16'b1111_0000_1111_0000;
    @(posedge clk);
      init  = 0;

    // Pequeña espera antes de arrancar (2 ciclos)
    for (i = 0; i < 2; i = i + 1)
      @(posedge clk);

    start = 1;                      
    @(posedge clk);
    start = 0;

    @(posedge done);                 
    #20;                            

    @(posedge clk);
      init  = 1;
      B     = 16'b1111_0000_1111_0001;
    @(posedge clk);
      init  = 0;

    for (i = 0; i < 2; i = i + 1)
      @(posedge clk);

    start = 1;
    @(posedge clk);
    start = 0;

    @(posedge done);
    #20;

    $finish;
  end

  always @(posedge done) begin
    $display("--------------------------------------------------");
    $display("numero : %b", B);
    $display("Es par: %0d  (1 = si, 0 = no)", par);
  end


  initial begin : TEST_CASE
    $dumpfile("Paridad_TB.vcd");
    $dumpvars(-1, uut);  
    #((PERIOD*DUTY_CYCLE)*600) $finish;
  end
endmodule
