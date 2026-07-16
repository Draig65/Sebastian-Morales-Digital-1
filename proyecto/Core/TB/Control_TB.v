`timescale 1ns / 1ps

module Control_TB;
 reg clk;
 reg rst;
 reg frame_ready;
 reg done_led;
 reg ultimo_led;
 reg reset_fin;
 wire start_frame;
 wire start_led;
 wire next_led;
 wire next_frame;
 wire en_reset;
 wire [2:0] state;
 integer i;

 localparam ESPERA = 3'b000;
 localparam MEM    = 3'b001;
 localparam CARGA  = 3'b010;
 localparam ENVIA  = 3'b011;
 localparam LATCH  = 3'b100;

 control_matriz uut (.clk(clk),.rst(rst),.frame_ready(frame_ready),
                     .done_led(done_led),.ultimo_led(ultimo_led),
                     .reset_fin(reset_fin),.start_frame(start_frame),
                     .start_led(start_led),.next_led(next_led),
                     .next_frame(next_frame),.en_reset(en_reset),.state(state));

 always #20 clk = ~clk;

 // avanza un flanco de reloj y verifica a que estado se llego
 task espera_estado;
   input [2:0] esperado;
   begin
     @(posedge clk); #1;
     if(state !== esperado) begin
       $display("Control_TB FAIL: estado=%0d esperado=%0d",state,esperado);
       $fatal(1);
     end
   end
 endtask

 initial begin
   $dumpfile("TB/Control_TB.vcd");
   $dumpvars(0,Control_TB);

   clk = 0;
   rst = 1;
   frame_ready = 0;
   done_led = 0;
   ultimo_led = 0;
   reset_fin = 0;

   repeat(2) @(posedge clk);
   @(negedge clk);
   rst = 0;
   #1;

   // 1) arranca en LATCH con en_reset activo (limpia la linea al encender)
   if(state !== LATCH) begin
     $display("Control_TB FAIL: no arranca en LATCH (state=%0d)",state);
     $fatal(1);
   end
   if(en_reset !== 1 || start_frame !== 0 || start_led !== 0 || next_led !== 0) begin
     $display("Control_TB FAIL: salidas incorrectas en LATCH inicial");
     $fatal(1);
   end

   // 2) latch inicial: al terminar NO debe avanzar de frame (cambia_frame=0)
   @(negedge clk);
   reset_fin = 1;
   #1;
   if(next_frame !== 0) begin
     $display("Control_TB FAIL: next_frame activo en el latch inicial");
     $fatal(1);
   end
   espera_estado(ESPERA);
   @(negedge clk);
   reset_fin = 0;

   // 3) en ESPERA sin frame_ready se queda quieto
   for(i=0;i<3;i=i+1) begin
     @(posedge clk); #1;
     if(state !== ESPERA || start_frame !== 0) begin
       $display("Control_TB FAIL: sale de ESPERA sin frame_ready");
       $fatal(1);
     end
   end

   // 4) frame_ready: da start_frame en el mismo ciclo y pasa a MEM
   @(negedge clk);
   frame_ready = 1;
   #1;
   if(start_frame !== 1) begin
     $display("Control_TB FAIL: no da start_frame con frame_ready");
     $fatal(1);
   end
   espera_estado(MEM);
   @(negedge clk);
   frame_ready = 0;
   #1;
   if(start_frame !== 0 || start_led !== 0 || next_led !== 0 || next_frame !== 0 || en_reset !== 0) begin
     $display("Control_TB FAIL: ordenes activas en MEM");
     $fatal(1);
   end

   // 5) MEM -> CARGA (start_led) -> ENVIA
   espera_estado(CARGA);
   if(start_led !== 1) begin
     $display("Control_TB FAIL: start_led apagado en CARGA");
     $fatal(1);
   end
   espera_estado(ENVIA);
   if(start_led !== 0) begin
     $display("Control_TB FAIL: start_led sigue activo en ENVIA");
     $fatal(1);
   end

   // 6) se queda en ENVIA mientras no llegue done_led
   for(i=0;i<3;i=i+1) begin
     @(posedge clk); #1;
     if(state !== ENVIA) begin
       $display("Control_TB FAIL: sale de ENVIA sin done_led");
       $fatal(1);
     end
   end

   // 7) done_led sin ultimo_led: pulso next_led y vuelve a MEM
   @(negedge clk);
   done_led = 1;
   ultimo_led = 0;
   #1;
   if(next_led !== 1) begin
     $display("Control_TB FAIL: no da next_led con done_led sin ultimo");
     $fatal(1);
   end
   espera_estado(MEM);
   @(negedge clk);
   done_led = 0;
   espera_estado(CARGA);
   espera_estado(ENVIA);

   // 8) done_led con ultimo_led: SIN next_led y pasa a LATCH
   @(negedge clk);
   done_led = 1;
   ultimo_led = 1;
   #1;
   if(next_led !== 0) begin
     $display("Control_TB FAIL: next_led activo con ultimo_led");
     $fatal(1);
   end
   espera_estado(LATCH);
   @(negedge clk);
   done_led = 0;
   ultimo_led = 0;
   #1;
   if(en_reset !== 1) begin
     $display("Control_TB FAIL: en_reset apagado en LATCH");
     $fatal(1);
   end
   if(next_frame !== 0) begin
     $display("Control_TB FAIL: next_frame antes de reset_fin");
     $fatal(1);
   end

   // 9) fin del latch tras un frame completo: ahora SI avanza el frame
   @(negedge clk);
   reset_fin = 1;
   #1;
   if(next_frame !== 1) begin
     $display("Control_TB FAIL: no avanza de frame tras un frame completo");
     $fatal(1);
   end
   espera_estado(ESPERA);
   @(negedge clk);
   reset_fin = 0;

   $display("Control_TB PASS: secuencia de estados, ordenes y cambia_frame correctos");
   $finish;
 end

 initial begin
   #100_000;
   $display("Control_TB FAIL: timeout");
   $fatal(1);
 end
endmodule
