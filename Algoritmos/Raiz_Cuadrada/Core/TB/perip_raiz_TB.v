`timescale 1ns / 1ps

module perip_raiz_TB;
  reg clk;
  reg         reset;
  reg  [15:0] d_in;
  reg         cs;
  reg  [4:0]  addr;
  reg         rd;
  reg         wr;
  wire [31:0] d_out;

  peripheral_raiz uut (.clk(clk),.reset(reset),.d_in(d_in),.cs(cs),.addr(addr),  .rd(rd),.wr(wr),.d_out(d_out));

  always #5 clk = ~clk;

  task write_register;
    input [4:0]  register_addr;
    input [15:0] value;
    begin
      @(posedge clk);
      cs   = 1;
      wr   = 1;
      rd   = 0;
      addr = register_addr;
      d_in = value;
      @(negedge clk);
      #1;
      @(posedge clk);
      cs   = 0;
      wr   = 0;
      addr = 0;
      d_in = 0;
    end
  endtask

  task read_register;
    input  [4:0]  register_addr;
    output [31:0] value;
    begin
      @(posedge clk);
      cs   = 1;
      wr   = 0;
      rd   = 1;
      addr = register_addr;
      @(negedge clk);
      #1 value = d_out;
      @(posedge clk);
      cs   = 0;
      rd   = 0;
      addr = 0;
    end
  endtask

  task run_case;
    input [15:0] value;
    input [31:0] expected;
    integer cycles;
    reg [31:0] status;
    reg [31:0] result;
    begin
      write_register(5'h04, value);
      write_register(5'h0c, 16'd1);

      repeat (2) @(posedge clk);
      write_register(5'h0c, 16'd0);

      cycles = 0;
      status = 0;
      while ((status[0] !== 1'b1) && (cycles < 100)) begin
        read_register(5'h14, status);
        cycles = cycles + 1;
      end

      if (status[0] !== 1'b1) begin
        $display("perip_raiz_TB FAIL: timeout para radical=%0d", value);
        $fatal(1);
      end

      read_register(5'h10, result);
      if (result !== expected) begin
        $display("perip_raiz_TB FAIL: sqrt(%0d) esperado=%0d obtenido=%0d",
                 value, expected, result);
        $fatal(1);
      end

      $display("perip_raiz_TB OK: sqrt(%0d) = %0d", value, result);
    end
  endtask

  initial begin
    $dumpfile("TB/perip_raiz_TB.vcd");
    $dumpvars(0, perip_raiz_TB);

    clk   = 0;
    reset = 1;
    d_in  = 0;
    cs    = 0;
    addr  = 0;
    rd    = 0;
    wr    = 0;

    repeat (2) @(negedge clk);
    @(posedge clk);
    reset = 0;

    run_case(16'd121, 32'd11);
    run_case(16'd200, 32'd14);

    $display("perip_raiz_TB PASS");
    $finish;
  end
endmodule
