`timescale 1ns / 1ps

module div_TB;
  reg         clk;
  reg         rst;
  reg         start;
  reg  [15:0] A;
  reg  [15:0] B;
  wire [15:0] cociente;
  wire        done;

  div uut (.clk(clk),.rst(rst),.start(start),.A(A),.B(B),.cociente(cociente),.done(done) );

  always #5 clk = ~clk;

  task run_case;
    input [15:0] dividend;
    input [15:0] divisor;
    input [15:0] expected;
    integer cycles;
    begin
      @(negedge clk);
      A     = divisor;
      B     = dividend;
      start = 1;

      // The current FSM needs two edges to restart from its END state.
      repeat (2) @(posedge clk);
      @(negedge clk);
      start = 0;

      cycles = 0;
      while ((done !== 1'b1) && (cycles < 200)) begin
        @(posedge clk);
        #1;
        cycles = cycles + 1;
      end

      if (done !== 1'b1) begin
        $display("div_TB FAIL: timeout para %0d / %0d", dividend, divisor);
        $fatal(1);
      end

      if (cociente !== expected) begin
        $display("div_TB FAIL: %0d / %0d esperado=%0d obtenido=%0d",
                 dividend, divisor, expected, cociente);
        $fatal(1);
      end

      $display("div_TB OK: %0d / %0d = %0d (%0d ciclos)",
               dividend, divisor, cociente, cycles);
    end
  endtask

  initial begin
    $dumpfile("TB/div_TB.vcd");
    $dumpvars(0, div_TB);

    clk   = 0;
    rst   = 1;
    start = 0;
    A     = 0;
    B     = 0;

    repeat (2) @(posedge clk);
    @(negedge clk);
    rst = 0;

    run_case(16'd50,    16'd2,   16'd25);
    run_case(16'd27,    16'd5,   16'd5);
    run_case(16'd7,     16'd10,  16'd0);
    run_case(16'd0,     16'd7,   16'd0);
    run_case(16'hffff,  16'd1,   16'hffff);
    run_case(16'hffff,  16'd255, 16'd257);

    $display("div_TB PASS");
    $finish;
  end
endmodule
