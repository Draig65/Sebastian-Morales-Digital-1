module contador_frame (
    input clk,
    input rst,
    input start,
    input next,
    output ready,
    output reg [15:0] frame_index,
    output reg [31:0] frame_timer
);

assign ready = (frame_timer >= 50_000_000);

always @(posedge clk) begin
 if (rst) begin
        frame_timer <= 50_000_000;
        frame_index <= 16'b0;
end
    else begin
        if (start)
            frame_timer <= 32'b0;
        else if (frame_timer < 50_000_000)
            frame_timer <= frame_timer + 1'b1;

        if (next) begin
            if (frame_index == 4)
                frame_index <= 16'b0;
            else
            frame_index <= frame_index + 1'b1;
        end
    end
end

endmodule
