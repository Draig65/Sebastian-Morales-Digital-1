`timescale 1ns / 1ps

module perip_par_TB;
  reg  clk;
  reg reset;
  reg  [15:0] d_in;
  reg cs;
  reg  [4:0]  addr;
  reg rd;
  reg wr;
  wire [31:0] d_out;

  peripheral_par uut (.clk(clk),.reset(reset),.d_in(d_in),.cs(cs),.addr(addr),.rd(rd),.wr(wr),.d_out(d_out));

  always #5 clk = ~clk;

  task write_register;
    input [4:0]  register_addr;
    input [15:0] value;
    begin
      @(posedge clk);
      cs = 1;
      wr = 1;
      rd  = 0;
     addr = register_addr;
      d_in = value;
      @(negedge clk);
      #1;
      @(posedge clk);
      cs  = 0;
      wr  = 0;
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
      while ((status[0] !== 1'b1) && (cycles < 300)) begin
        read_register(5'h14, status);
        cycles = cycles + 1;
      end

      if (status[0] !== 1'b1) begin
        $display("perip_par_TB FAIL: timeout para B=%h", value);
        $fatal(1);
      end

      read_register(5'h10, result);
      if (result !== expected) begin
        $display("perip_par_TB FAIL: B=%h esperado=%b obtenido=%b",
                 value, expected[0], result[0]);
        $fatal(1);
      end

      $display("perip_par_TB OK: B=%h paridad_impar=%b", value, result[0]);
    end
  endtask

  initial begin
    $dumpfile("TB/perip_par_TB.vcd");
    $dumpvars(0, perip_par_TB);

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

    run_case(16'hf0f0, 32'd0);
    run_case(16'hf0f1, 32'd1);

    $display("perip_par_TB PASS");
    $finish;
  end
endmodule
