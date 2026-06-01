`timescale 1ns / 1ps

module Control_TB;
  reg  clk, rst, start, z, z_co;
  wire load, sh, sub_ra;
  wire  r0;
  wire load_ac, dec;
  wire done;

  parameter PERIOD = 20;
  Control uut (
    .clk(clk), .rst(rst), .start(start), .z(z), .z_co(z_co), .done(done),
    .sh(sh),.load(load),.load_ac(load_ac), .r0(r0),.dec(dec)
  );

  event reset_trigger, reset_done_trigger;
  initial begin 
    forever begin 
      @ (reset_trigger); @ (negedge clk); rst = 1;
      @ (negedge clk); rst = 0; -> reset_done_trigger;
    end
  end

  initial begin clk = 0; rst = 1; start = 0; z = 0; z_a = 0; end
  initial forever begin clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2); end

  initial begin 
    #10 -> reset_trigger; @ (reset_done_trigger);
    
    $display("\n--- Simulando ciclo de control FSM ---");
    @ (posedge clk); start = 1;
    @ (posedge clk); start = 0; 
    $display("[IDLE->STEP1] Habilitadores activos: load_ra=%b, clear_b=%b", load_ra, clear_b);

    @ (posedge clk);
    $display("[STEP1->STEP2] Habilitadores activos: shift_ra=%b, load_c=%b", shift_ra, load_c);

    @ (posedge clk);
    $display("[STEP2->COMP]  Habilitadores activos: calc_c=%b, shift_b=%b", calc_c, shift_b);

    // Simulamos que R >= C es verdadero (z = 1)
    z = 1; 
    @ (posedge clk);
    $display("[COMP->CHK_A]  (z=1) Habilitadores activos: sub_ra=%b, set_b0=%b", sub_ra, set_b0);

    // Simulamos que A ya llegó a 0 (z_a = 1) para terminar el bucle
    z_a = 1;
    @ (posedge clk);
    @ (posedge clk);
    $display("[CHK_A->DONE]  ¿Se levantó bandera done?: %b", done);
    
    #20; $finish;
  end     

  initial begin: TEST_CASE
    $dumpfile("Control_TB.vcd"); $dumpvars(-1, uut);
  end
endmodule
