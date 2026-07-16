module pulso_ws (
    input  clk,
    input  rst,
    input  start,
    input  sigue,
    input  dato,
    output dout,
    output fin
);

reg activo;
wire fin_t;
wire [5:0] cuenta;
wire [5:0] tiempo;

assign tiempo = dato ? 20 : 10;
assign dout = activo && (cuenta < tiempo);
assign fin = fin_t;

cuenta_tiempo cont ( .clk(clk), .rst(rst), .en(activo), .fin(fin_t), .cuenta(cuenta) );

always @(posedge clk) begin
    if(rst)
        activo <= 0;
    else if(!activo) begin
        if(start)
            activo <= 1;
    end
    else if(fin_t) begin
        if(!sigue)
            activo <= 0;
    end
end

endmodule
