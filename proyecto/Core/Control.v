module control_matriz (
    input clk,
    input rst,
    input frame_ready,
    input done_led,
    input ultimo_led,
    input reset_fin,
    output reg start_frame,
    output reg start_led,
    output reg next_led,
    output reg next_frame,
    output reg en_reset,
    output reg [2:0] state
);

 parameter ESPERA = 3'b000;
 parameter MEM    = 3'b001;
 parameter CARGA  = 3'b010;
 parameter ENVIA  = 3'b011;
 parameter LATCH  = 3'b100;

reg cambia_frame;

always @(posedge clk) begin
    if (rst) begin
        state <= LATCH;
        cambia_frame <= 0;
    end else begin
        case (state)
            ESPERA:
                if(frame_ready)
                    state <= MEM;
                else
                    state <= ESPERA;
            MEM:
                state <= CARGA;
            CARGA:
                state <= ENVIA;
            ENVIA:
                if(done_led) begin
                    if(ultimo_led) begin
                        state <= LATCH;
                        cambia_frame <= 1;
                    end
                    else
                        state <= MEM;
                end
                else
                    state <= ENVIA;
            LATCH:
                if(reset_fin) begin
                    state <= ESPERA;
                    cambia_frame <= 0;
                end
                else
                    state <= LATCH;
            default:
                state <= LATCH;
        endcase
    end
end

always @(*) begin
    case (state)
        ESPERA: begin
            start_frame <= frame_ready;
            start_led   <= 0;
            next_led    <= 0;
            next_frame  <= 0;
            en_reset    <= 0;
        end
        MEM: begin
            start_frame <= 0;
            start_led   <= 0;
            next_led    <= 0;
            next_frame  <= 0;
            en_reset    <= 0;
        end
        CARGA: begin
            start_frame <= 0;
            start_led   <= 1;
            next_led    <= 0;
            next_frame  <= 0;
            en_reset    <= 0;
        end
        ENVIA: begin
            start_frame <= 0;
            start_led   <= 0;
            next_led    <= done_led && !ultimo_led;
            next_frame  <= 0;
            en_reset    <= 0;
        end
        LATCH: begin
            start_frame <= 0;
            start_led   <= 0;
            next_led    <= 0;
            next_frame  <= reset_fin && cambia_frame;
            en_reset    <= 1;
        end
        default: begin
            start_frame <= 0;
            start_led   <= 0;
            next_led    <= 0;
            next_frame  <= 0;
            en_reset    <= 0;
        end
    endcase
end

`ifdef BENCH
reg [8*40:1] state_name;
always @(*) begin
  case(state)
    ESPERA : state_name = "ESPERA";
    MEM    : state_name = "MEM";
    CARGA  : state_name = "CARGA";
    ENVIA  : state_name = "ENVIA";
    LATCH  : state_name = "LATCH";
  endcase
end
`endif

endmodule