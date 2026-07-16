module peripheral_ws2812 (
    input             clk,
    input             reset,
    input      [15:0] d_in,
    input             cs,
    input      [4:0]  addr,
    input             rd,
    input             wr,
    output reg [31:0] d_out,
    output            ws_data
);

reg [2:0] s;
reg init;
wire reset_n;

always @(*) begin
    if(cs) begin
        case(addr)
            5'h0C: s = 3'b001;
            5'h10: s = 3'b010;
            5'h14: s = 3'b100;
            default: s = 3'b000;
        endcase
    end
    else
        s = 3'b000;
end

always @(posedge clk) begin
    if(reset)
        init = 0;
    else begin
        if(cs && wr)
            init = s[0] ? d_in[0] : init;
    end
end

always @(posedge clk) begin
    if(reset)
        d_out = 0;
    else if(cs) begin
        case(s)
            3'b010: d_out = {31'b0,ws_data};
            3'b100: d_out = {31'b0,init};
            default: d_out = 0;
        endcase
    end
    else
        d_out = 0;
end

assign reset_n = init & ~reset;

ws2812_player player ( .clk(clk), .reset_n(reset_n), .ws_data(ws_data) );

endmodule
