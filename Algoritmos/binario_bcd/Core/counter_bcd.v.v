module counter_bcd(
    input clk,
    input rst,
    input load,
    input dec,
    output reg [3:0] count,
    output z
);

    always @(negedge clk) begin
        if (rst) begin
            count <= 4'd8;
        end else if (load) begin
            count <= 4'd8; 
        end else if (dec) begin
            count <= count - 4'd1;
        end else begin
            count <= count;
        end
    end

    assign z = (count == 4'd0) ? 1'b1 : 1'b0;

endmodule
