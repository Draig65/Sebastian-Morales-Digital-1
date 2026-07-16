module rsr_bin(
    input clk,
    input rst,
    input load,
    input shift,
    input ld_acc,
    input [7:0] in_data,
    input [3:0] sub_high,
    input [3:0] sub_low,
    output reg [15:0] r0,
    output [7:0] result
);

    always @(negedge clk) begin
        if (rst) begin
            r0 <= 16'h0000;
        end else if (load) begin
            r0 <= {in_data, 8'h00};
        end else if (shift) begin
            r0 <= r0 >> 1;
        end else if (ld_acc) begin
            r0 <= {sub_high, sub_low, r0[7:0]};
        end else begin
            r0 <= r0;
        end
    end
    assign result = r0[7:0];

endmodule
