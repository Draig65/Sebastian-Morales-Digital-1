`timescale 1ns / 1ps

module cont_reset_TB;
 reg clk;
 reg rst;
 reg en;
 wire fin;
 wire [15:0] reset_counter;
 integer i;
 integer ciclos;

 contador_reset uut (.clk(clk),.rst(rst),.en(en),.fin(fin),
                     .reset_counter(reset_counter));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/cont_reset_TB.vcd");
   $dumpvars(0,cont_reset_TB);

   clk = 0;
   rst = 1;
   en = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;

   // 1) con en=0 queda congelado en 0
   for(i=0;i<5;i=i+1) begin
     @(posedge clk); #1;
     if(reset_counter !== 0 || fin !== 0) begin
       $display("cont_reset_TB FAIL: cuenta o fin activos con en=0");
       $fatal(1);
     end
   end

   // 2) si en se quita a mitad de la cuenta, vuelve a 0
   @(negedge clk);
   en = 1;
   repeat(100) @(posedge clk);
   #1;
   if(reset_counter !== 100) begin
     $display("cont_reset_TB FAIL: counter=%0d esperado=100",reset_counter);
     $fatal(1);
   end
   @(negedge clk);
   en = 0;
   @(posedge clk); #1;
   if(reset_counter !== 0) begin
     $display("cont_reset_TB FAIL: no vuelve a 0 al quitar en");
     $fatal(1);
   end

   // 3) cuenta completa: fin exactamente en el ciclo 7499 (7500 ciclos = 300 us)
   @(negedge clk);
   en = 1;
   ciclos = 0;
   while(fin !== 1'b1) begin
     @(posedge clk); #1;
     ciclos = ciclos + 1;
   end
   if(ciclos !== 7499 || reset_counter !== 7499) begin
     $display("cont_reset_TB FAIL: fin en ciclo=%0d counter=%0d esperado=7499",
              ciclos,reset_counter);
     $fatal(1);
   end

   // 4) tras fin se reinicia solo
   @(posedge clk); #1;
   if(reset_counter !== 0 || fin !== 0) begin
     $display("cont_reset_TB FAIL: no se reinicia despues de fin");
     $fatal(1);
   end
   @(negedge clk);
   en = 0;

   $display("cont_reset_TB PASS: 7500 ciclos de latch, reinicio y limpieza con en=0");
   $finish;
 end

 initial begin
   #1_000_000;
   $display("cont_reset_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
