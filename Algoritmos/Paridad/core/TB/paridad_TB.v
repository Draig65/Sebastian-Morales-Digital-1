`timescale 1ns / 1ps

module paridad_TB;
reg  clk;
  reg  rst;
  reg  start;
  reg  [15:0] B;
  wire  resultado;
  wire   done;

  paridad uut (.clk(clk),.rst(rst),.start(start),.B(B),.resultado(resultado),.done(done));

  always #5 clk = ~clk;

  task run_case;
    input [15:0] value;
    input        expected;
    integer cycles;
    begin
      @(negedge clk);
      B     = value;
       start = 1;
      repeat (2) @(posedge clk);
    @(negedge clk);
      start = 0;
 cycles = 0;
      while ((done !== 1'b1) && (cycles < 300)) begin
        @(posedge clk);
        #1;
        cycles = cycles + 1;
      end

  if (done !== 1'b1) begin
        $display("paridad_TB FAIL: timeout para B=%h", value);
        $fatal(1);
      end

   if (resultado !== expected) begin
        $display("paridad_TB FAIL: B=%h esperado=%b obtenido=%b", value, expected, resultado);
        $fatal(1);
      end

      $display("paridad_TB OK: B=%h paridad_impar=%b (%0d ciclos)",value, resultado, cycles);
    end
  endtask

  initial begin
    $dumpfile("TB/paridad_TB.vcd");
     $dumpvars(0, paridad_TB);

     clk   = 0;
    rst   = 1;
     start = 0;
    B     = 0;

  repeat (2) @(posedge clk);
     @(negedge clk);
    rst = 0;

  run_case(16'h0000, 1'b0);
  run_case(16'h0001, 1'b1);
  run_case(16'hffff, 1'b0);
  run_case(16'hf0f0, 1'b0);
    run_case(16'hf0f1, 1'b1);
    run_case(16'haaaa, 1'b0);
    run_case(16'h8000, 1'b1);

    $display("paridad_TB PASS");
    $finish;
  end
endmodule
