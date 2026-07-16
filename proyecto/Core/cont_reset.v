module contador_reset (
input clk,
input rst,
input en,
output fin,
output reg [15:0] reset_counter
);

assign fin = (reset_counter == 7499);

always @(posedge clk) begin
    if (rst)
        reset_counter <= 16'b0;
    else if (en) begin
        if (fin)
            reset_counter <= 16'b0;
        else
            reset_counter <= reset_counter + 1'b1;
    end
    else
        reset_counter <= 16'b0;
end

endmodule
