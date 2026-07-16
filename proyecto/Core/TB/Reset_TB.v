`timescale 1ns / 1ps

module Reset_TB;
 reg clk;
 reg reset_n;
 wire rst;
 integer i;

 reset_ws uut (.clk(clk),.reset_n(reset_n),.rst(rst));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/Reset_TB.vcd");
   $dumpvars(0,Reset_TB);

   clk = 0;
   reset_n = 0;
   #1;

   // 1) al encender arranca reseteado (reset_sync inicia en 00)
   if(rst !== 1) begin
     $display("Reset_TB FAIL: no arranca reseteado");
     $fatal(1);
   end

   // 2) con reset_n en bajo, rst se mantiene aunque pasen flancos
   for(i=0;i<3;i=i+1) begin
     @(posedge clk); #1;
     if(rst !== 1) begin
       $display("Reset_TB FAIL: rst cayo con reset_n en bajo");
       $fatal(1);
     end
   end

   // 3) liberacion sincronizada: exactamente 2 flancos despues de soltar
   @(negedge clk);
   reset_n = 1;
   @(posedge clk); #1;
   if(rst !== 1) begin
     $display("Reset_TB FAIL: solto el reset en 1 flanco (deben ser 2)");
     $fatal(1);
   end
   @(posedge clk); #1;
   if(rst !== 0) begin
     $display("Reset_TB FAIL: no solto el reset en 2 flancos");
     $fatal(1);
   end
   for(i=0;i<3;i=i+1) begin
     @(posedge clk); #1;
     if(rst !== 0) begin
       $display("Reset_TB FAIL: rst rebota tras liberarse");
       $fatal(1);
     end
   end

   // 4) aplicacion asincrona: entra de inmediato, sin esperar flanco
   @(posedge clk);
   #7;
   reset_n = 0;
   #1;
   if(rst !== 1) begin
     $display("Reset_TB FAIL: el reset no entro asincronicamente");
     $fatal(1);
   end

   $display("Reset_TB PASS: arranque reseteado, liberacion en 2 flancos y entrada asincrona");
   $finish;
 end

 initial begin
   #100_000;
   $display("Reset_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
