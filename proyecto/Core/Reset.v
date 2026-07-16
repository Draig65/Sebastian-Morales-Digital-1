module reset_ws (
    input  clk,
    input  reset_n,
    output rst
);

reg [1:0] reset_sync = 2'b00;

assign rst = ~reset_sync[1];

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        reset_sync <= 2'b00;
    else
        reset_sync <= {reset_sync[0],1'b1};
end

endmodule
