`timescale 1ns / 1ps

module peri_divi_TB;
  reg         clk;
  reg         reset;
  reg  [15:0] d_in;
  reg         cs;
  reg  [4:0]  addr;
  reg         rd;
  reg         wr;
  wire [31:0] d_out;

  peripheral_div uut (.clk(clk),.reset(reset),.d_in(d_in),.cs(cs),.addr(addr),.rd(rd),.wr(wr),.d_out(d_out));

  always #5 clk = ~clk;

  task write_register;
    input [4:0]  register_addr;
    input [15:0] value;
    begin
      @(negedge clk);
      cs   = 1;
      wr   = 1;
      rd   = 0;
      addr = register_addr;
      d_in = value;
      @(posedge clk);
      #1;
      @(negedge clk);
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
      @(negedge clk);
      cs   = 1;
      wr   = 0;
      rd   = 1;
      addr = register_addr;
      @(posedge clk);
      #1 value = d_out;
      @(negedge clk);
      cs   = 0;
      rd   = 0;
      addr = 0;
    end
  endtask

  task run_case;
    input [15:0] dividend;
    input [15:0] divisor;
    input [31:0] expected;
    integer cycles;
    reg [31:0] status;
    reg [31:0] result;
    begin
      // The wrapper maps register A to the dividend and B to the divisor.
      write_register(5'h04, dividend);
      write_register(5'h08, divisor);
      write_register(5'h0c, 16'd1);

      repeat (2) @(posedge clk);
      write_register(5'h0c, 16'd0);

      cycles = 0;
      status = 0;
      while ((status[0] !== 1'b1) && (cycles < 200)) begin
        read_register(5'h14, status);
        cycles = cycles + 1;
      end

      if (status[0] !== 1'b1) begin
        $display("peri_divi_TB FAIL: timeout para %0d / %0d", dividend, divisor);
        $fatal(1);
      end

      read_register(5'h10, result);
      if (result !== expected) begin
        $display("peri_divi_TB FAIL: %0d / %0d esperado=%0d obtenido=%0d",
                 dividend, divisor, expected, result);
        $fatal(1);
      end

      $display("peri_divi_TB OK: %0d / %0d = %0d", dividend, divisor, result);
    end
  endtask

  initial begin
    $dumpfile("TB/peri_divi_TB.vcd");
    $dumpvars(0, peri_divi_TB);

    clk   = 0;
    reset = 1;
    d_in  = 0;
    cs    = 0;
    addr  = 0;
    rd    = 0;
    wr    = 0;

    repeat (2) @(posedge clk);
    @(negedge clk);
    reset = 0;

    run_case(16'd100, 16'd4,  32'd25);
    run_case(16'd27,  16'd5,  32'd5);

    $display("peri_divi_TB PASS");
    $finish;
  end
endmodule
