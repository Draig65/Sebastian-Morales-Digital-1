module comp_bcd(
    input [3:0] nibble_in,
    output [3:0] nibble_out
);
    reg [3:0] tmp;
    
    always @(*) begin
        if (nibble_in >= 4'd5)
            tmp = nibble_in + 4'd3;
        else
            tmp = nibble_in;
    end
    
    assign nibble_out = tmp;
endmodule
