`timescale 1ns / 1ps

module Memoria_TB;
 reg clk;
 reg [10:0] dir;
 wire [11:0] dato;

 memoria_frames uut (.clk(clk),.dir(dir),.dato(dato));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/Memoria_TB.vcd");
   $dumpvars(0,Memoria_TB);

   clk = 0;
   dir = 0;

   // con -DBENCH no se carga frames.hex: se escriben posiciones conocidas
   #1;
   uut.frame_mem[0]    = 12'habc;
   uut.frame_mem[1]    = 12'h123;
   uut.frame_mem[512]  = 12'h456;
   uut.frame_mem[1279] = 12'hfff;

   // 1) lectura basica
   @(negedge clk);
   dir = 0;
   @(posedge clk); #1;
   if(dato !== 12'habc) begin
     $display("Memoria_TB FAIL: dir=0 dato=%h esperado=abc",dato);
     $fatal(1);
   end

   // 2) la lectura es sincrona: cambiar dir NO cambia dato hasta el flanco
   @(negedge clk);
   dir = 1;
   #1;
   if(dato !== 12'habc) begin
     $display("Memoria_TB FAIL: el dato cambio sin flanco (no es lectura sincrona)");
     $fatal(1);
   end
   @(posedge clk); #1;
   if(dato !== 12'h123) begin
     $display("Memoria_TB FAIL: dir=1 dato=%h esperado=123",dato);
     $fatal(1);
   end

   // 3) direccion en la mitad y ultima posicion valida (1279)
   @(negedge clk);
   dir = 512;
   @(posedge clk); #1;
   if(dato !== 12'h456) begin
     $display("Memoria_TB FAIL: dir=512 dato=%h esperado=456",dato);
     $fatal(1);
   end
   @(negedge clk);
   dir = 1279;
   @(posedge clk); #1;
   if(dato !== 12'hfff) begin
     $display("Memoria_TB FAIL: dir=1279 dato=%h esperado=fff",dato);
     $fatal(1);
   end

   $display("Memoria_TB PASS: lectura sincrona de 1 ciclo y rango 0-1279 correctos");
   $finish;
 end

 initial begin
   #100_000;
   $display("Memoria_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
