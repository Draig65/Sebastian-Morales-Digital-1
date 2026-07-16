`timescale 1ns / 1ps

module Control_TB;
  reg  clk;
  reg  rst;
  reg  start;
  reg  z;
  reg  z_a;
  wire load_ra;
  wire shift_ra;
  wire sub_ra;
  wire shift_b;
  wire set_b0;
  wire load_c;
  wire calc_c;
  wire done;

  control uut (.clk(clk),.rst(rst),.start(start),.z(z),
    .z_a(z_a),.load_ra(load_ra),.shift_ra(shift_ra),.sub_ra(sub_ra),.shift_b(shift_b),.set_b0(set_b0),.load_c(load_c),.calc_c(calc_c),.done(done));

  always #5 clk = ~clk;

  task check_outputs;
    input expected_load_ra;
    input expected_shift_ra;
    input expected_sub_ra;
    input expected_shift_b;
    input expected_set_b0;
    input expected_load_c;
    input expected_calc_c;
    input expected_done;
    begin
      #1;
      if ({load_ra, shift_ra, sub_ra, shift_b, set_b0, load_c, calc_c, done} !==
          {expected_load_ra, expected_shift_ra, expected_sub_ra, expected_shift_b,
           expected_set_b0, expected_load_c, expected_calc_c, expected_done}) begin
        $display("Control_TB FAIL: esperado=%b%b%b%b%b%b%b%b obtenido=%b%b%b%b%b%b%b%b",
                 expected_load_ra, expected_shift_ra, expected_sub_ra, expected_shift_b,
                 expected_set_b0, expected_load_c, expected_calc_c, expected_done,
                 load_ra, shift_ra, sub_ra, shift_b, set_b0, load_c, calc_c, done);
        $fatal(1);
      end
    end
  endtask

  initial begin
    $dumpfile("TB/Control_TB.vcd");
    $dumpvars(0, Control_TB);

    clk   = 0;
    rst   = 1;
    start = 0;
    z     = 0;
    z_a   = 0;

    #1;
    check_outputs(1, 0, 0, 0, 0, 0, 0, 0);

    @(negedge clk);
    rst   = 0;
    start = 1;
    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0, 1, 0, 0);

    @(negedge clk);
    start = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 1, 0, 0, 1, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z = 1;
    @(posedge clk);
    check_outputs(0, 0, 1, 0, 1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z_a = 0;
    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0, 1, 0, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 1, 0, 0, 1, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z_a = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 1);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0, 0, 1);

    @(negedge clk);
    start = 1;
    @(posedge clk);
    check_outputs(1, 0, 0, 0, 0, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0, 1, 0, 0);

    $display("Control_TB PASS");
    $finish;
  end
endmodule
