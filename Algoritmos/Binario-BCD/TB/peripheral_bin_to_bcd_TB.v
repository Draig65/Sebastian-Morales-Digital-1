`timescale 1ns / 1ps
`define SIMULATION

module peripheral_bin_to_bcd_TB;
   reg clk;
   reg reset;
   reg [15:0] d_in;
   reg cs;
   reg [4:0] addr;
   reg rd;
   reg wr;
   wire [31:0] d_out;

   peripheral_bin_to_bcd uut (
      .clk(clk), 
      .reset(reset), 
      .d_in(d_in), 
      .cs(cs), 
      .addr(addr), 
      .rd(rd), 
      .wr(wr), 
      .d_out(d_out) 
   );

   parameter PERIOD = 20; // 


   initial begin  
      clk = 0; reset = 0; d_in = 0; addr = 5'h00; cs = 0; rd = 0; wr = 0;
   end

  
   always #(PERIOD/2) clk = ~clk;

   initial begin 
     $dumpfile("TB/peripheral_bin_to_bcd_TB.vcd");
     $dumpvars(0, peripheral_bin_to_bcd_TB);

 
     @ (negedge clk);
     reset = 1;
     @ (negedge clk);
     reset = 0;
     #(PERIOD*4);


     $display("--- Iniciando Prueba 1: Binario 45 -> BCD ---");
     
  
     cs = 1; wr = 1; rd = 0;
     addr = 5'h04;
     d_in = 16'h002D; 
     #(PERIOD);
     cs = 0; wr = 0;
     #(PERIOD*2);

 
     cs = 1; wr = 1; rd = 0;
     addr = 5'h0C;
     d_in = 16'h0001;
     #(PERIOD);
  
     d_in = 16'h0000;
     #(PERIOD);
     cs = 0; wr = 0;

 
     #(PERIOD*30);

     cs = 1; wr = 0; rd = 1;
     addr = 5'h14;
     #(PERIOD);
     $display("Lectura Registro DONE (Addr 0x14): %d (Esperado: 1)", d_out);
     cs = 0; rd = 0;
     #(PERIOD);


     cs = 1; wr = 0; rd = 1;
     addr = 5'h10;
     #(PERIOD);
     $display("Lectura Registro RESULT (Addr 0x10): 0x%h (Esperado BCD: 0x00000045)", d_out);
     cs = 0; rd = 0;
     #(PERIOD*5);


     $display("--- Iniciando Prueba 2: Binario 78 -> BCD ---");
     
   
     cs = 1; wr = 1; rd = 0;
     addr = 5'h04;
     d_in = 16'h004E; 
     cs = 0; wr = 0;
     #(PERIOD*2);

  
     cs = 1; wr = 1; rd = 0;
     addr = 5'h0C;
     d_in = 16'h0001;
     #(PERIOD);
     d_in = 16'h0000;
     #(PERIOD);
     cs = 0; wr = 0;


     #(PERIOD*30);


     cs = 1; wr = 0; rd = 1;
     addr = 5'h10;
     #(PERIOD);
     $display("Lectura Registro RESULT (Addr 0x10): 0x%h (Esperado BCD: 0x00000078)", d_out);
     cs = 0; rd = 0;
     #(PERIOD*10);

     $display("--- Fin de la Simulación peripheral_bin_to_bcd_TB ---");
     $finish;
   end
endmodule