`timescale 1ns / 1ps

module Corr_ra_TB;
  reg        clk;
  reg        rst;
  reg        load;
  reg  [7:0] radical_in;
  reg        shift;
  reg        sub_en;
  reg  [7:0] C;
  wire [8:0] A;
  wire [7:0] R;

  Corrimiento_ra uut (.clk(clk),  .rst(rst),.load(load),.radical_in(radical_in),.shift(shift), .sub_en(sub_en),.C(C),.A(A),.R(R));

  always #5 clk = ~clk;

  task check_result;
    input [8:0] expected_A;
    input [7:0] expected_R;
    begin
      #1;
      if ((A !== expected_A) || (R !== expected_R)) begin
        $display("Corr_ra_TB FAIL: A esperado=%h obtenido=%h, R esperado=%h obtenido=%h",
                 expected_A, A, expected_R, R);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Corr_ra_TB.vcd");
    $dumpvars(0, Corr_ra_TB);

    clk        = 0;
    rst        = 1;
    load       = 0;
    radical_in = 0;
    shift      = 0;
    sub_en     = 0;
    C          = 0;

    #1;
    check_result(9'd0, 8'd0);

    @(negedge clk);
    rst        = 0;
    load       = 1;
    radical_in = 8'ha5;
    @(posedge clk);
    check_result(9'h14b, 8'h00);

    @(negedge clk);
    load  = 0;
    shift = 1;
    @(posedge clk);
    check_result(9'h12c, 8'h02);

    @(negedge clk);
    shift  = 0;
    sub_en = 1;
    C      = 8'd1;
    @(posedge clk);
    check_result(9'h12c, 8'h01);

    @(negedge clk);
    shift  = 1;
    sub_en = 0;
    @(posedge clk);
    check_result(9'h0b0, 8'h06);

    @(negedge clk);
    load       = 1;
    shift      = 1;
    sub_en     = 1;
    radical_in = 8'hff;
    @(posedge clk);
    check_result(9'h1ff, 8'h00);

    @(negedge clk);
    rst  = 1;
    load = 0;
    #1;
    check_result(9'd0, 8'd0);

    $display("Corr_ra_TB PASS");
    $finish;
  end
endmodule
