`timescale 1ns / 1ps

module peri_ws2812_TB;
 reg clk;
 reg reset;
 reg [15:0] d_in;
 reg cs;
 reg [4:0] addr;
 reg rd;
 reg wr;
 wire [31:0] d_out;
 wire ws_data;
 integer cycles;
 reg [31:0] status;

 peripheral_ws2812 uut
 (.clk(clk),.reset(reset),.d_in(d_in),.cs(cs),.addr(addr),
 .rd(rd),.wr(wr),.d_out(d_out),.ws_data(ws_data));

 always #50 clk = ~clk;

 task write_register;
   input [4:0] register_addr;
   input [15:0] value;
   begin
     @(negedge clk);
     cs = 1;
     wr = 1;
     rd = 0;
     addr = register_addr;
     d_in = value;
     @(posedge clk);
     #1;
     @(negedge clk);
     cs = 0;
     wr = 0;
     addr = 0;
     d_in = 0;
   end
 endtask

 task read_register;
   input [4:0] register_addr;
   output [31:0] value;
   begin
     @(negedge clk);
     cs = 1;
     wr = 0;
     rd = 1;
     addr = register_addr;
     @(posedge clk);
     #1 value = d_out;
     @(negedge clk);
     cs = 0;
     rd = 0;
     addr = 0;
   end
 endtask

 initial begin
   $dumpfile("TB/peri_ws2812_TB.vcd");
   $dumpvars(0,peri_ws2812_TB);

   clk = 0;
   reset = 1;
   d_in = 0;
   cs = 0;
   addr = 0;
   rd = 0;
   wr = 0;

   #1;
   uut.player.mem.frame_mem[0] = 12'ha5c;
   uut.player.mem.frame_mem[1] = 12'h123;
   uut.player.mem.frame_mem[2] = 12'h456;
   uut.player.mem.frame_mem[3] = 12'h789;

   repeat(2) @(posedge clk);
   @(negedge clk);
   reset = 0;

   read_register(5'h14,status);
   if(status[0] !== 0) begin
     $display("peri_ws2812_TB FAIL: init no inicia en cero");
     $fatal(1);
   end

   write_register(5'h0c,16'd1);
   read_register(5'h14,status);
   if(status[0] !== 1) begin
     $display("peri_ws2812_TB FAIL: no activa init");
     $fatal(1);
   end

   cycles = 0;
   while((ws_data !== 1'b1) && (cycles < 20000)) begin
     @(posedge clk);
     #1;
     cycles = cycles + 1;
   end
   if(ws_data !== 1'b1) begin
     $display("peri_ws2812_TB FAIL: no inicia la salida ws");
     $fatal(1);
   end

   write_register(5'h0c,16'd0);
   repeat(3) @(posedge clk);
   #1;
   if(ws_data !== 1'b0) begin
     $display("peri_ws2812_TB FAIL: ws_data no se apaga");
     $fatal(1);
   end

   read_register(5'h14,status);
   if(status[0] !== 0) begin
     $display("peri_ws2812_TB FAIL: init no se limpia");
     $fatal(1);
   end

   $display("peri_ws2812_TB PASS");
   $finish;
 end
endmodule
