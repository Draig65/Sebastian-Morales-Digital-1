module envia_led (
    input clk,
    input rst,
    input start,
    input [11:0] color,
    output dout,
    output done
);

reg activo;
reg [23:0] dato;
reg [4:0] bit_num;
wire bit_fin;
wire sigue;
wire inicio;
wire [23:0] grb;

assign grb = {color[7:4],color[7:4],color[11:8],color[11:8],color[3:0],color[3:0]};
assign inicio = start && !activo;
assign sigue = activo && bit_fin && (bit_num != 0);
assign done = activo && bit_fin && (bit_num == 0);

pulso_ws bit0 ( .clk(clk), .rst(rst), .start(inicio), .sigue(sigue),.dato(dato[23]), .dout(dout), .fin(bit_fin) );

always @(posedge clk) begin
    if(rst) begin
        activo <= 0;
        dato <= 0;
        bit_num <= 0;
    end
    else if(!activo) begin
        if(start) begin
            activo <= 1;
            dato <= grb;
            bit_num <= 23;
        end
    end
    else if(bit_fin) begin
        if(bit_num == 0)
            activo <= 0;
        else begin
            dato <= {dato[22:0],1'b0};
            bit_num <= bit_num-1'b1;
        end
    end
end

endmodule
