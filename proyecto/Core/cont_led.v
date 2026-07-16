module contador_led (
    input clk,
    input rst,
    input start,
    input next,
    input [15:0] frame_index,
    output reg [15:0] led_index,
    output reg [10:0] rom_addr,
    output ultimo
);

assign ultimo = (led_index == 255);

always @(posedge clk) begin
    if (rst) begin
        led_index <= 16'b0;
        rom_addr  <= 11'b0;
    end
    else if (start) begin
        led_index <= 16'b0;
        rom_addr  <= frame_index * 256;
    end
    else if (next) begin
        led_index <= led_index + 1'b1;
        rom_addr  <= rom_addr + 1'b1;
    end
end

endmodule
