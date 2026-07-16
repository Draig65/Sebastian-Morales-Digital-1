`timescale 1ns / 1ps

module cont_frame_TB;
 reg clk;
 reg rst;
 reg start;
 reg next;
 wire ready;
 wire [15:0] frame_index;
 wire [31:0] frame_timer;
 integer i;

 contador_frame uut (.clk(clk),.rst(rst),.start(start),.next(next),
                     .ready(ready),.frame_index(frame_index),
                     .frame_timer(frame_timer));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/cont_frame_TB.vcd");
   $dumpvars(0,cont_frame_TB);

   clk = 0;
   rst = 1;
   start = 0;
   next = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;
   #1;

   // 1) tras el reset el temporizador nace "vencido": ready inmediato
   if(frame_timer !== 50_000_000 || ready !== 1 || frame_index !== 0) begin
     $display("cont_frame_TB FAIL: tras reset timer=%0d ready=%b index=%0d",
              frame_timer,ready,frame_index);
     $fatal(1);
   end

   // 2) start reinicia el temporizador y apaga ready
   @(negedge clk);
   start = 1;
   @(negedge clk);
   start = 0;
   #1;
   if(frame_timer !== 0 || ready !== 0) begin
     $display("cont_frame_TB FAIL: start no reinicia (timer=%0d ready=%b)",
              frame_timer,ready);
     $fatal(1);
   end

   // 3) cuenta exactamente 1 por ciclo
   for(i=1;i<=10;i=i+1) begin
     @(posedge clk); #1;
     if(frame_timer !== i) begin
       $display("cont_frame_TB FAIL: timer=%0d esperado=%0d",frame_timer,i);
       $fatal(1);
     end
   end

   // 4) umbral exacto de los 2 segundos: se salta cerca del final
   //    (truco de simulacion: esperar 50M de ciclos reales tardaria minutos)
   @(negedge clk);
   uut.frame_timer = 50_000_000 - 2;
   @(posedge clk); #1;
   if(ready !== 0) begin
     $display("cont_frame_TB FAIL: ready antes de tiempo (timer=%0d)",frame_timer);
     $fatal(1);
   end
   @(posedge clk); #1;
   if(ready !== 1 || frame_timer !== 50_000_000) begin
     $display("cont_frame_TB FAIL: no llega al umbral (timer=%0d ready=%b)",
              frame_timer,ready);
     $fatal(1);
   end
   @(posedge clk); #1;
   if(frame_timer !== 50_000_000 || ready !== 1) begin
     $display("cont_frame_TB FAIL: el timer no satura en 50M (timer=%0d)",frame_timer);
     $fatal(1);
   end

   // 5) next avanza el indice 0->1->2->3->4 y vuelve a 0 (5 frames)
   for(i=1;i<=5;i=i+1) begin
     @(negedge clk);
     next = 1;
     @(negedge clk);
     next = 0;
     #1;
     if(frame_index !== ((i==5) ? 0 : i)) begin
       $display("cont_frame_TB FAIL: index=%0d esperado=%0d",
                frame_index,(i==5) ? 0 : i);
       $fatal(1);
     end
   end

   $display("cont_frame_TB PASS: ready inicial, umbral de 50M, saturacion e indice 0-4 correctos");
   $finish;
 end

 initial begin
   #100_000;
   $display("cont_frame_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
