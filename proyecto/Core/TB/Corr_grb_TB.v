`timescale 1ns / 1ps

module Corr_grb_TB;
 reg clk;
 reg rst;
 reg start;
 reg [11:0] color;
 wire dout;
 wire done;
 reg [23:0] expected_grb;
 integer bit_number;
 integer expected_high;
 integer i;
 time rise_time;
 time high_time;
 time bit_period;

 envia_led uut (.clk(clk),.rst(rst),.start(start),.color(color),.dout(dout),.done(done));

 always #20 clk = ~clk;

 // envia un LED y verifica los 24 bits GRB, sus tiempos y el done final
 task verifica_led;
   input [11:0] col;
   input [23:0] esperado;
   begin
     expected_grb = esperado;
     @(negedge clk);
     color = col;
     start = 1;
     // primero se espera la subida del bit 23 (llega justo tras el proximo
     // flanco de clk) y despues se suelta start, para no perderse ese flanco
     @(posedge dout);
     rise_time = $time;
     @(negedge clk);
     start = 0;

     for(bit_number=23; bit_number>=0; bit_number=bit_number-1) begin
       @(negedge dout);
       high_time = $time - rise_time;
       expected_high = expected_grb[bit_number] ? 800 : 400;
       if(high_time !== expected_high) begin
         $display("Corr_grb_TB FAIL: color=%h bit=%0d alto=%0t esperado=%0d",
                  col,bit_number,high_time,expected_high);
         $fatal(1);
       end

       if(bit_number != 0) begin
         @(posedge dout);
         bit_period = $time - rise_time;
         if(bit_period !== 1240) begin
           $display("Corr_grb_TB FAIL: periodo=%0t esperado=1240",bit_period);
           $fatal(1);
         end
         rise_time = $time;
       end
     end

     @(posedge done);

     // tras done la linea queda en bajo (reposo)
     for(i=0;i<40;i=i+1) begin
       @(posedge clk); #1;
       if(dout !== 0) begin
         $display("Corr_grb_TB FAIL: dout activo despues de done");
         $fatal(1);
       end
     end
   end
 endtask

 initial begin
   $dumpfile("TB/Corr_grb_TB.vcd");
   $dumpvars(0,Corr_grb_TB);

   clk = 0;
   rst = 1;
   start = 0;
   color = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;

   // color RGB A5C -> GRB con nibbles duplicados: 55 AA CC
   verifica_led(12'ha5c,24'h55aacc);
   // segundo LED para verificar que vuelve a arrancar desde reposo
   verifica_led(12'h123,24'h221133);

   $display("Corr_grb_TB PASS: conversion GRB, 24 bits MSB primero y done correctos");
   $finish;
 end

 initial begin
   #200_000;
   $display("Corr_grb_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
