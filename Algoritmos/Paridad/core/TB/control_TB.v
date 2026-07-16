`timescale 1ns / 1ps

module control_TB;
  reg  clk;
  reg  rst;
  reg  init;
reg  b0;
  reg  z_co;
wire done;
  wire shift;
wire load;
  wire inc;
  wire dec;

  control uut (   .clk(clk),  .rst(rst),.init(init),   .b0(b0),.z_co(z_co),.done(done), .shift(shift),.load(load),.inc(inc), .dec(dec));

  always #5 clk = ~clk;

  task check_outputs;
    input expected_done;
    input expected_shift;
    input expected_load;
    input expected_inc;
    input expected_dec;
    begin
      #1;
      if ({done, shift, load, inc, dec} !==
          {expected_done, expected_shift, expected_load, expected_inc, expected_dec}) begin
        $display("control_TB FAIL: esperado=%b%b%b%b%b obtenido=%b%b%b%b%b",
                 expected_done, expected_shift, expected_load, expected_inc, expected_dec,
                 done, shift, load, inc, dec);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/control_TB.vcd");
    $dumpvars(0, control_TB);

    clk  = 0;
    rst  = 1;
    init = 0;
    b0   = 0;
    z_co = 0;

    #1;
    check_outputs(0, 0, 0, 0, 0);

    @(negedge clk);
    rst  = 0;
    init = 1;
    @(posedge clk);
    check_outputs(0, 0, 1, 0, 0);

    @(negedge clk);
    init = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0);

    @(negedge clk);
    b0 = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 1, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 1);

    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0);

    @(negedge clk);
    z_co = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0);

    @(negedge clk);
    b0 = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 1);

    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0);

    @(negedge clk);
    z_co = 1;
    @(posedge clk);
    check_outputs(1, 0, 0, 0, 0);

    @(posedge clk);
    check_outputs(1, 0, 0, 0, 0);

    @(negedge clk);
    init = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 1, 0, 0);

    $display("control_TB PASS");
    $finish;
  end
endmodule
