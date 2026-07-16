`timescale 1ns / 1ps

module sum_r_TB;
reg         clk;
  reg         rst;
   reg  [15:0] in_B;
  reg         shift;
  reg         load;
  wire [15:0] out_B;
  wire        b0;

  Corr_b uut (.clk(clk),  .rst(rst),.in_B(in_B),.shift(shift),.load(load),.out_B(out_B),.b0(b0));

  always #5 clk = ~clk;

  task check_result;
    input [15:0] expected_out;
    input        expected_b0;
    begin
      #1;
      if ((out_B !== expected_out) || (b0 !== expected_b0)) begin
        $display("Corr_b_TB FAIL: out esperado=%h obtenido=%h, b0 esperado=%b obtenido=%b",
                 expected_out, out_B, expected_b0, b0);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/sum_r_TB.vcd");
    $dumpvars(0, sum_r_TB);

     clk   = 0;
     rst   = 1;
    in_B  = 0;
    shift = 0;
    load  = 0;

    @(posedge clk);
    check_result(16'd0, 1'b0);

    @(negedge clk);
     rst  = 0;
     load = 1;
     in_B = 16'ha55b;
    @(posedge clk);
      check_result(16'ha55b, 1'b1);

    @(negedge clk);
    load  = 0;
    shift = 1;
    @(posedge clk);
     check_result(16'h52ad, 1'b1);

    @(posedge clk);
    check_result(16'h2956, 1'b0);

    @(negedge clk);
    shift = 0;
    @(posedge clk);
    check_result(16'h2956, 1'b0);

    @(negedge clk);
     load  = 1;
     shift = 1;
     in_B  = 16'h0001;
    @(posedge clk);
    check_result(16'h0001, 1'b1);

    @(negedge clk);
    rst  = 1;
    load = 0;
    @(posedge clk);
    check_result(16'd0, 1'b0);

    $display("sum_r_TB PASS");
     $finish;
end
endmodule
