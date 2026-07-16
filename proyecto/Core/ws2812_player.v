module ws2812_player (input  clk,input  reset_n,output ws_data);

wire w_rst;
wire [11:0] w_rom_data;
wire [10:0] w_rom_addr;
wire [31:0] w_frame_timer;
wire [15:0] w_reset_counter;
wire [15:0] w_frame_index;
wire [15:0] w_led_index;
wire w_frame_ready;
wire w_ultimo_led;
wire w_reset_fin;
wire w_done_led;
wire w_start_frame;
wire w_next_led;
wire w_next_frame;
wire w_en_reset;
wire w_start_led;
wire [2:0] w_state;

reset_ws rst1 ( .clk(clk), .reset_n(reset_n), .rst(w_rst) );

control_matriz ctrl ( .clk(clk), .rst(w_rst), .frame_ready(w_frame_ready), .done_led(w_done_led),
                      .ultimo_led(w_ultimo_led), .reset_fin(w_reset_fin), .start_frame(w_start_frame),
                      .start_led(w_start_led), .next_led(w_next_led), .next_frame(w_next_frame),
                      .en_reset(w_en_reset), .state(w_state) );

memoria_frames mem  ( .clk(clk), .dir(w_rom_addr), .dato(w_rom_data) );

envia_led  led  ( .clk(clk), .rst(w_rst), .start(w_start_led), .color(w_rom_data),.dout(ws_data), .done(w_done_led) );

contador_led cont_led ( .clk(clk), .rst(w_rst), .start(w_start_frame), .next(w_next_led),
                          .frame_index(w_frame_index), .led_index(w_led_index),
                          .rom_addr(w_rom_addr), .ultimo(w_ultimo_led) );

contador_frame cont_frame ( .clk(clk), .rst(w_rst), .start(w_start_frame), .next(w_next_frame),
                            .ready(w_frame_ready), .frame_index(w_frame_index),
                            .frame_timer(w_frame_timer) );

contador_reset cont_rst ( .clk(clk), .rst(w_rst), .en(w_en_reset), .fin(w_reset_fin),.reset_counter(w_reset_counter) );

endmodule
