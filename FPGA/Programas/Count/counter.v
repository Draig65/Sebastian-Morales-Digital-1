module blink(
    input clk,    // Reloj de 50MHz
    input rst,    // Reset (activo en bajo)
    output LED    // Salida al LED
);

    reg [26:0] counter = 0;
    assign LED = ~counter[24];

    always @(posedge clk) begin
        if (~rst) begin
            counter <= 0;
        end
        else begin 
            counter <= counter + 1;
        end
    end

endmodule
