`timescale 1ns / 1ps

module pulso_ws_TB;
 reg clk;
 reg rst;
 reg start;
 reg sigue;
 reg dato;
 wire dout;
 wire fin;
 integer i;
 time rise1;
 time rise2;
 time high_time;

 pulso_ws uut (.clk(clk),.rst(rst),.start(start),.sigue(sigue),
               .dato(dato),.dout(dout),.fin(fin));

 always #20 clk = ~clk;

 // envia un bit suelto (sigue=0) y verifica su tiempo en alto y el reposo final
 task envia_bit_suelto;
   input valor;
   input integer alto_esperado;
   begin
     @(negedge clk);
     dato = valor;
     sigue = 0;
     start = 1;
     // primero se espera la subida (llega justo tras el proximo flanco de clk)
     // y despues se suelta start, para no perderse el arranque del bit
     @(posedge dout);
     rise1 = $time;
     @(negedge clk);
     start = 0;
     @(negedge dout);
     high_time = $time - rise1;
     if(high_time !== alto_esperado) begin
       $display("pulso_ws_TB FAIL: bit=%b alto=%0t esperado=%0d",valor,high_time,alto_esperado);
       $fatal(1);
     end

     @(posedge fin);
     // sin sigue debe volver a reposo: linea en bajo dos periodos completos
     for(i=0;i<70;i=i+1) begin
       @(posedge clk); #1;
       if(dout !== 0) begin
         $display("pulso_ws_TB FAIL: dout no queda en bajo tras un bit suelto");
         $fatal(1);
       end
     end
   end
 endtask

 initial begin
   $dumpfile("TB/pulso_ws_TB.vcd");
   $dumpvars(0,pulso_ws_TB);

   clk = 0;
   rst = 1;
   start = 0;
   sigue = 0;
   dato = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;

   // 1) un bit 0: 400 ns en alto   2) un bit 1: 800 ns en alto
   envia_bit_suelto(1'b0,400);
   envia_bit_suelto(1'b1,800);

   // 3) dos bits 1 encadenados con sigue: sin hueco entre ellos (periodo 1240 ns)
   @(negedge clk);
   dato = 1;
   sigue = 1;
   start = 1;
   @(posedge dout);
   rise1 = $time;
   @(negedge clk);
   start = 0;
   @(negedge dout);
   if($time - rise1 !== 800) begin
     $display("pulso_ws_TB FAIL: primer bit encadenado alto=%0t esperado=800",$time-rise1);
     $fatal(1);
   end

   @(posedge dout);
   rise2 = $time;
   if(rise2 - rise1 !== 1240) begin
     $display("pulso_ws_TB FAIL: periodo entre bits=%0t esperado=1240",rise2-rise1);
     $fatal(1);
   end

   @(negedge clk);
   sigue = 0;
   @(negedge dout);
   if($time - rise2 !== 800) begin
     $display("pulso_ws_TB FAIL: segundo bit encadenado alto=%0t esperado=800",$time-rise2);
     $fatal(1);
   end

   @(posedge fin);
   for(i=0;i<70;i=i+1) begin
     @(posedge clk); #1;
     if(dout !== 0) begin
       $display("pulso_ws_TB FAIL: dout no queda en bajo tras el tren de bits");
       $fatal(1);
     end
   end

   $display("pulso_ws_TB PASS: anchos 400/800 ns, encadenado sin huecos y reposo correcto");
   $finish;
 end

 initial begin
   #200_000;
   $display("pulso_ws_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
