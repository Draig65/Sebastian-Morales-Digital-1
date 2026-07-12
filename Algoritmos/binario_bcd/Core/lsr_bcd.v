module lsr_bcd(
    input clk,
    input rst,
    input load,
    input shift,
    input ld_acc,
    input [7:0] in_data,
    input [3:0] add_high,
    input [3:0] add_low,
    output reg [15:0] r0,
    output [7:0] result
);

    always @(negedge clk) begin
        if (rst) begin
            r0 <= 16'h0000;
        end else if (load) begin
            r0 <= {8'h00, in_data};
        end else if (shift) begin
            r0 <= r0 << 1;
        end else if (ld_acc) begin
            r0 <= {add_high, add_low, r0[7:0]};
        end else begin
            r0 <= r0;
        end
    end

    assign result = r0[15:8];

endmodule
