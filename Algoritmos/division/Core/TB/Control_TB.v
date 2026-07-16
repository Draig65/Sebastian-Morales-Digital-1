`timescale 1ns / 1ps

module Control_TB;
reg  clk;
  reg  rst;
  reg  start;
  reg  z;
  reg  z_co;
  wire done;
  wire sh;
  wire load;
  wire load_ac;
  wire r0;
  wire dec;

  control uut (.clk(clk),.rst(rst),.start(start),.z(z),.z_co(z_co),.done(done),.sh(sh),.load(load),.load_ac(load_ac),.r0(r0),.dec(dec));

  always #5 clk = ~clk;

  task check_outputs;
    input expected_done;
    input expected_sh;
    input expected_load;
    input expected_load_ac;
    input expected_r0;
    input expected_dec;
    begin
      #1;
      if ({done, sh, load, load_ac, r0, dec} !==
          {expected_done, expected_sh, expected_load,
           expected_load_ac, expected_r0, expected_dec}) begin
        $display("Control_TB FAIL: esperado=%b%b%b%b%b%b obtenido=%b%b%b%b%b%b",
                 expected_done, expected_sh, expected_load,
                 expected_load_ac, expected_r0, expected_dec,
                 done, sh, load, load_ac, r0, dec);
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
    z_co  = 0;

    #1;
    check_outputs(0, 0, 1, 0, 0, 0);

    @(negedge clk);
    rst   = 0;
    start = 1;
    @(posedge clk);
     check_outputs(0, 1, 0, 0, 0, 1);

    @(negedge clk);
    start = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z = 1;
    @(posedge clk);
    check_outputs(0, 0, 0, 1, 1, 0);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z_co = 0;
    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0, 1);

    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z = 0;
    @(posedge clk);
    check_outputs(0, 0, 0, 0, 0, 0);

    @(negedge clk);
    z_co = 1;
    @(posedge clk);
    check_outputs(1, 0, 0, 0, 0, 0);

    @(posedge clk);
    check_outputs(1, 0, 0, 0, 0, 0);

    @(negedge clk);
    start = 1;
    @(posedge clk);
    check_outputs(0, 0, 1, 0, 0, 0);

    @(posedge clk);
    check_outputs(0, 1, 0, 0, 0, 1);

    $display("Control_TB PASS");
    $finish;
  end
endmodule
