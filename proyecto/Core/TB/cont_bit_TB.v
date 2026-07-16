`timescale 1ns / 1ps

module cont_bit_TB;
 reg clk;
 reg rst;
 reg en;
 wire fin;
 wire [5:0] cuenta;
 integer i;
 time t_fin1;

 cuenta_tiempo uut (.clk(clk),.rst(rst),.en(en),.fin(fin),.cuenta(cuenta));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/cont_bit_TB.vcd");
   $dumpvars(0,cont_bit_TB);

   clk = 0;
   rst = 1;
   en = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;

   // 1) con en=0 el contador queda congelado en 0 y fin apagado
   for(i=0;i<5;i=i+1) begin
     @(posedge clk); #1;
     if(cuenta !== 0 || fin !== 0) begin
       $display("cont_bit_TB FAIL: cuenta=%0d fin=%b con en=0",cuenta,fin);
       $fatal(1);
     end
   end

   // 2) habilitado: fin debe llegar exactamente con cuenta==30
   @(negedge clk);
   en = 1;

   @(posedge fin);
   t_fin1 = $time;
   if(cuenta !== 30) begin
     $display("cont_bit_TB FAIL: fin con cuenta=%0d esperado=30",cuenta);
     $fatal(1);
   end

   // 3) fin debe durar exactamente 1 ciclo (40 ns)
   @(negedge fin);
   if($time - t_fin1 !== 40) begin
     $display("cont_bit_TB FAIL: fin duro %0t esperado=40",$time-t_fin1);
     $fatal(1);
   end

   // 4) reinicio automatico: el siguiente fin llega 31 ciclos (1240 ns) despues
   @(posedge fin);
   if($time - t_fin1 !== 1240) begin
     $display("cont_bit_TB FAIL: periodo=%0t esperado=1240",$time-t_fin1);
     $fatal(1);
   end

   // 5) al quitar en, la cuenta vuelve a 0
   @(negedge clk);
   en = 0;
   @(posedge clk); #1;
   if(cuenta !== 0) begin
     $display("cont_bit_TB FAIL: cuenta=%0d tras quitar en, esperado=0",cuenta);
     $fatal(1);
   end

   $display("cont_bit_TB PASS: 31 ciclos por bit, fin de 1 ciclo y reinicio automatico");
   $finish;
 end

 initial begin
   #100_000;
   $display("cont_bit_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
