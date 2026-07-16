`timescale 1ns / 1ps

module control_bin_TB;
  reg clk;
  reg rst;
  reg init;
  reg z;
  wire done;
  wire sh;
  wire load;
  wire ld_acc;

  control_bin uut (
    .clk(clk),
    .rst(rst),
    .init(init),
    .z(z),
    .done(done),
    .sh(sh),
    .load(load),
    .ld_acc(ld_acc)
  );

  always #10 clk = ~clk;

  initial begin
    $dumpfile("TB/control_bin_TB.vcd");
    $dumpvars(0, control_bin_TB);

    clk = 0; rst = 1; init = 0; z = 0;
    #20 rst = 0;


    init = 1; @(posedge clk); #1;
    if (load !== 1'b1) begin
      $display("control_bin_TB FAIL: No se activó la carga en el estado START"); $fatal(1);
    end
    init = 0;

   
    @(posedge clk); #1; 
    if (sh !== 1'b1) begin
      $display("control_bin_TB FAIL: No se activó sh en SHIFT"); $fatal(1);
    end

    @(posedge clk); #1; 
    @(posedge clk); #1; 
    if (ld_acc !== 1'b1) begin
      $display("control_bin_TB FAIL: No se activó ld_acc en CHECK2"); $fatal(1);
    end

    @(posedge clk); #1; 
    @(posedge clk); #1; 

   
    z = 1;
    @(posedge clk); #1; 
    if (done !== 1'b1) begin
      $display("control_bin_TB FAIL: No se activó done en END_ST"); $fatal(1);
    end

    $display("control_bin_TB PASS");
    $finish;
  end
endmodule