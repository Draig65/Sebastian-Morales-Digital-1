`timescale 1ns / 1ps

module cont_TB;
  reg  clk;
  reg  rst;
  reg  load;
  reg  dec;
  wire z_co;

  cont uut (.clk(clk), .rst(rst),.load(load),  .dec(dec), .z_co(z_co));

  always #5 clk = ~clk;

  task check_count;
    input [4:0] expected_count;
    input       expected_z;
    begin
      #1;
      if ((uut.cont !== expected_count) || (z_co !== expected_z)) begin
        $display("cont_TB FAIL: contador esperado=%0d obtenido=%0d, z esperado=%b obtenido=%b",
                 expected_count, uut.cont, expected_z, z_co);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/cont_TB.vcd");
    $dumpvars(0, cont_TB);

    clk  = 0;
    rst  = 1;
    load = 0;
    dec  = 0;

    @(posedge clk);
    check_count(5'd16, 1'b0);

    @(negedge clk);
    rst = 0;
    dec = 1;
    @(posedge clk);
    check_count(5'd15, 1'b0);

    repeat (14) @(posedge clk);
    check_count(5'd1, 1'b0);

    @(posedge clk);
    check_count(5'd0, 1'b1);

    @(negedge clk);
    load = 1;
    dec  = 1;
    @(posedge clk);
    check_count(5'd16, 1'b0);

    @(negedge clk);
    load = 0;
    dec  = 0;
    @(posedge clk);
    check_count(5'd16, 1'b0);

    $display("cont_TB PASS");
    $finish;
  end
endmodule
