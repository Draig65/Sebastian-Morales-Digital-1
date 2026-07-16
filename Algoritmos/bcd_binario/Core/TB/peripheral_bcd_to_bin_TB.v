`timescale 1ns / 1ps
`define SIMULATION

module peripheral_bcd_to_bin_TB;
   reg clk;
   reg reset;
   reg [15:0] d_in;
   reg cs;
   reg [4:0] addr;
   reg rd;
   reg wr;
   wire [31:0] d_out;

   
   peripheral_bcd_to_bin uut (
      .clk(clk), 
      .reset(reset), 
      .d_in(d_in), 
      .cs(cs), 
      .addr(addr), 
      .rd(rd), 
      .wr(wr), 
      .d_out(d_out) 
   );

   parameter PERIOD = 20; 

  
   initial begin  
      clk = 0; reset = 0; d_in = 0; addr = 5'h00; cs = 0; rd = 0; wr = 0;
   end

   // Reloj principal
   always #(PERIOD/2) clk = ~clk;

   initial begin 
     $dumpfile("TB/peripheral_bcd_to_bin_TB.vcd");
     $dumpvars(0, peripheral_bcd_to_bin_TB);

    
     @ (negedge clk);
     reset = 1;
     @ (negedge clk);
     reset = 0;
     #(PERIOD*4);

   
   
     $display("--- Iniciando Prueba 1: BCD 0x45 -> Binario ---");
     
    
     cs = 1; wr = 1; rd = 0;
     addr = 5'h04;
     d_in = 16'h0045;
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
     $display("Lectura Registro RESULT (Addr 0x10): %d en decimal / 0x%h en Hex (Esperado: 45 / 0x0000002d)", d_out, d_out);
     cs = 0; rd = 0;
     #(PERIOD*5);

    
     $display("--- Iniciando Prueba 2: BCD 0x99 -> Binario ---");
     
     
     cs = 1; wr = 1; rd = 0;
     addr = 5'h04;
     d_in = 16'h0099; 
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
     addr = 5'h10;
     #(PERIOD);
     $display("Lectura Registro RESULT (Addr 0x10): %d en decimal / 0x%h en Hex (Esperado: 99 / 0x00000063)", d_out, d_out);
     cs = 0; rd = 0;
     #(PERIOD*10);

     $display("--- Fin de la Simulación peripheral_bcd_to_bin_TB ---");
     $finish;
   end
endmodule