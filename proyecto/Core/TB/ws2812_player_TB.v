`timescale 1ns / 1ps

module ws2812_player_TB;
 reg clk;
 reg reset_n;
 wire ws_data;

 reg [23:0] expected_grb;
 integer bit_number;
 integer expected_high;
 integer startup_latch;
 integer latch_cycles;
 integer pulse_count;
 integer i;
 time rise_time;
 time high_time;
 time bit_period;

 ws2812_player uut (.clk(clk),.reset_n(reset_n),.ws_data(ws_data));

 always #20 clk = ~clk;

 always @(posedge ws_data)
   pulse_count = pulse_count + 1;

 initial begin
   $dumpfile("TB/ws2812_player_TB.vcd");
   $dumpvars(0,ws2812_player_TB);

   clk = 0;
   reset_n = 0;
   pulse_count = 0;
   expected_grb = 24'h55aacc;

   #1;
   for(i=0;i<512;i=i+1)
     uut.mem.frame_mem[i] = 12'h200;
   uut.mem.frame_mem[0] = 12'ha5c;
   uut.mem.frame_mem[1] = 12'h123;
   uut.mem.frame_mem[2] = 12'h456;
   uut.mem.frame_mem[3] = 12'h789;

   repeat(4) @(posedge clk);
   reset_n = 1;

   wait(uut.w_rst == 0);
   startup_latch = 0;
   while(uut.w_state == 3'd4) begin
     @(negedge clk);
     if(uut.w_state == 3'd4)
       startup_latch = startup_latch + 1;
   end

   if(startup_latch != 7500) begin
     $display("ws2812_player_TB FAIL: latch inicial=%0d esperado=7500",startup_latch);
     $fatal(1);
   end

   @(posedge ws_data);
   rise_time = $time;

   for(bit_number=23; bit_number>=0; bit_number=bit_number-1) begin
     @(negedge ws_data);
     high_time = $time-rise_time;
     expected_high = expected_grb[bit_number] ? 800 : 400;
     if(high_time != expected_high) begin
       $display("ws2812_player_TB FAIL bit=%0d high=%0t esperado=%0d",
       bit_number,high_time,expected_high);
       $fatal(1);
     end

     if(bit_number != 0) begin
       @(posedge ws_data);
       bit_period = $time-rise_time;
       if(bit_period != 1240) begin
         $display("ws2812_player_TB FAIL: periodo=%0t esperado=1240",bit_period);
         $fatal(1);
       end
       rise_time = $time;
     end
   end

   wait(uut.w_state == 3'd4);
   latch_cycles = 0;
   while(uut.w_state == 3'd4) begin
     @(negedge clk);
     if(uut.w_state == 3'd4)
       latch_cycles = latch_cycles + 1;
   end

   if(pulse_count != 6144) begin
     $display("ws2812_player_TB FAIL: pulsos=%0d esperado=6144",pulse_count);
     $fatal(1);
   end
   if(latch_cycles != 7500) begin
     $display("ws2812_player_TB FAIL: latch=%0d esperado=7500",latch_cycles);
     $fatal(1);
   end
   if(uut.w_frame_index != 1) begin
     $display("ws2812_player_TB FAIL: no avanza el frame");
     $fatal(1);
   end

   $display("ws2812_player_TB PASS: GRB, tiempos, 256 LEDs y frame correctos");
   $finish;
 end

 initial begin
   #12_000_000;
   $display("ws2812_player_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
