module cuenta_tiempo (
    input clk,
    input rst,
    input en,
    output fin,
    output reg [5:0] cuenta
);

assign fin = en && (cuenta == 30);

always @(posedge clk) begin
    if(rst)
        cuenta <= 0;
    else if(!en)
        cuenta <= 0;
    else if(fin)
        cuenta <= 0;
    else
        cuenta <= cuenta + 1'b1;
end

endmodule
