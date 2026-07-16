`timescale 1ns / 1ps

module Control_TB;
  reg  rst;
  reg  clk;
  reg  init;
  reg  ao;
  reg  z;
  wire shift;
  wire load;
  wire add;
  wire done;

  Control uut (.rst(rst),.clk(clk),.init(init),.ao(ao),.shift(shift),.load(load),.add(add),.z(z),.done(done) );

  always #5 clk = ~clk;

  task check_outputs;
    input expected_shift;
    input expected_load;
    input expected_add;
    input expected_done;
    begin
      #1;
      if ({shift, load, add, done} !==
          {expected_shift, expected_load, expected_add, expected_done}) begin
        $display("Control_TB FAIL: esperado=%b%b%b%b obtenido=%b%b%b%b",
                 expected_shift, expected_load, expected_add, expected_done,
                 shift, load, add, done);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Control_TB.vcd");
    $dumpvars(0, Control_TB);

    clk  = 0;
    rst  = 1;
    init = 0;
    ao   = 0;
    z    = 0;

    #1;
    check_outputs(0, 1, 0, 0);

    @(negedge clk);
    rst  = 0;
    init = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 0);

    @(negedge clk);
    init = 0;
    ao   = 1;
    @(posedge clk);
    check_outputs(0, 0, 1, 0);

    @(posedge clk);
    check_outputs(1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0);

    @(negedge clk);
    z = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0);

    @(negedge clk);
    ao = 0;
    @(posedge clk);
    check_outputs(1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0);

    @(negedge clk);
    z = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 1);

    @(posedge clk);
    check_outputs(0, 0, 0, 1);

    @(negedge clk);
    init = 1;
    @(posedge clk);
    check_outputs(0, 1, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0);

    $display("Control_TB PASS");
    $finish;
  end
endmodule
