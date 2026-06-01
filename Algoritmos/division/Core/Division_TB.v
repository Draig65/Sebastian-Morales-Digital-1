`timescale 1ns / 1ps
`define SIMULATION

module Divisor_TB;
  reg         rst;
  reg         clk;
  reg         init;
  reg         start;
  reg  [15:0] A; // Divisor
  reg  [15:0] B; // Dividendo

  wire [15:0] cociente;
  wire [15:0] resto;
  wire        done;

  div uut (.clk(clk), .rst(rst), .init(init), .start(start), .A(A), .B(B), .cociente(cociente), .done(done));

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
    clk = 0; 
    rst = 1; 
    init = 0; 
    start = 0;
    A = 16'd5;   // Divisor = 5
    B = 16'd27;  // Dividendo = 27
  end

  initial  begin  
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
    @(posedge done);
    #20
    $finish;
  end

  always@(posedge done) begin
    $display("Dividendo :%d",B); 
    $display("Divisor: %d",A);
    $display("Cociente: %d",cociente;
    end

  initial begin: TEST_CASE
    $dumpfile("Divisor_TB.vcd");
    $dumpvars(-1, uut);
    #((PERIOD*DUTY_CYCLE)*300) $finish;
  end

endmodule
