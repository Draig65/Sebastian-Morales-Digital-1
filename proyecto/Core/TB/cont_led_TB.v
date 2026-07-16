`timescale 1ns / 1ps

module cont_led_TB;
 reg clk;
 reg rst;
 reg start;
 reg next;
 reg [15:0] frame_index;
 wire [15:0] led_index;
 wire [10:0] rom_addr;
 wire ultimo;
 integer i;

 contador_led uut (.clk(clk),.rst(rst),.start(start),.next(next),
                   .frame_index(frame_index),.led_index(led_index),
                   .rom_addr(rom_addr),.ultimo(ultimo));

 always #20 clk = ~clk;

 initial begin
   $dumpfile("TB/cont_led_TB.vcd");
   $dumpvars(0,cont_led_TB);

   clk = 0;
   rst = 1;
   start = 0;
   next = 0;
   frame_index = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;
   #1;
   if(led_index !== 0 || rom_addr !== 0 || ultimo !== 0) begin
     $display("cont_led_TB FAIL: valores tras reset incorrectos");
     $fatal(1);
   end

   // start con frame 2: debe posicionarse en rom_addr = 2*256 = 512
   @(negedge clk);
   frame_index = 2;
   start = 1;
   @(negedge clk);
   start = 0;
   #1;
   if(led_index !== 0 || rom_addr !== 512) begin
     $display("cont_led_TB FAIL: start frame 2 -> led=%0d addr=%0d esperado 0 y 512",
              led_index,rom_addr);
     $fatal(1);
   end

   // recorrer los 256 LEDs con next sostenido: ambas cuentas avanzan juntas
   @(negedge clk);
   next = 1;
   for(i=1;i<=255;i=i+1) begin
     @(posedge clk); #1;
     if(led_index !== i || rom_addr !== 512+i) begin
       $display("cont_led_TB FAIL: paso %0d -> led=%0d addr=%0d esperado %0d y %0d",
                i,led_index,rom_addr,i,512+i);
       $fatal(1);
     end
     if(ultimo !== (i==255)) begin
       $display("cont_led_TB FAIL: ultimo=%b con led_index=%0d",ultimo,led_index);
       $fatal(1);
     end
   end
   @(negedge clk);
   next = 0;
   if(ultimo !== 1) begin
     $display("cont_led_TB FAIL: ultimo apagado en el LED 255");
     $fatal(1);
   end

   // nuevo start con frame 4: rom_addr = 4*256 = 1024 y ultimo se limpia
   @(negedge clk);
   frame_index = 4;
   start = 1;
   @(negedge clk);
   start = 0;
   #1;
   if(led_index !== 0 || rom_addr !== 1024 || ultimo !== 0) begin
     $display("cont_led_TB FAIL: start frame 4 -> led=%0d addr=%0d ultimo=%b",
              led_index,rom_addr,ultimo);
     $fatal(1);
   end

   $display("cont_led_TB PASS: 256 LEDs, direcciones de ROM y ultimo correctos");
   $finish;
 end

 initial begin
   #100_000;
   $display("cont_led_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
