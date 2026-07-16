`timescale 1ns / 1ps

module control_bcd_TB;
  reg clk;
  reg rst;
  reg init;
  reg z;
  wire done;
  wire sh;
  wire load;
  wire ld_acc;

  control_bcd uut (
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
    $dumpfile("TB/control_bcd_TB.vcd");
    $dumpvars(0, control_bcd_TB);

    clk = 0; rst = 1; init = 0; z = 0;
    #20 rst = 0;

    // En estado START, load debe estar activo cuando inicia
    init = 1; #20 init = 0;

    // Simular 8 ciclos alternando estados
    repeat(7) begin
      @(posedge clk); // SHIFT
      @(posedge clk); // CHECK
      @(posedge clk); // ACC
    end

    // Último ciclo activando la bandera z
    z = 1;
    @(posedge clk); // Entra a SHIFT/CHECK final
    @(posedge clk); // Debe pasar a END_ST

    #1;
    if (done !== 1'b1) begin
      $display("control_bcd_TB FAIL: No activó la señal done en el estado final");
      $fatal(1);
    end

    $display("control_bcd_TB PASS");
    $finish;
  end
endmodule