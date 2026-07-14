module control_bin(
    input clk,
    input rst,
    input init,
    input z,
    output reg done,
    output reg sh,
    output reg load,
    output reg ld_acc
);

    parameter START  = 3'b000;
    parameter SHIFT  = 3'b001;
    parameter CHECK1 = 3'b010;
    parameter CHECK2 = 3'b011;
    parameter ACC    = 3'b100;
    parameter END_ST = 3'b101;

    reg [2:0] state;
    reg [4:0] wait_cnt;

    initial begin
        done = 0;
        sh = 0;
        load = 0;
        ld_acc = 0;
        state = START;
        wait_cnt = 0;
    end

    always @(posedge clk) begin
        if (rst) begin
            state <= START;
        end else begin
            case(state)
                START: begin
                    done <= 0;
                    sh <= 0;
                    load <= 1;
                    ld_acc <= 0;
                    wait_cnt <= 0;
                    if (init)
                        state <= SHIFT;
                    else
                        state <= START;
                end

                SHIFT: begin
                    done <= 0;
                    sh <= 1;
                    load <= 0;
                    ld_acc <= 0;
                    if (z)
                        state <= END_ST;
                    else
                        state <= CHECK1;
                end

                CHECK1: begin
                    done <= 0;
                    sh <= 0;
                    load <= 0;
                    ld_acc <= 0;
                    if (z)
                        state <= END_ST;
                    else
                        state <= CHECK2;
                end

                CHECK2: begin
                    done <= 0;
                    sh <= 0;
                    load <= 0;
                    ld_acc <= 1;
                    state <= ACC;
                end

                ACC: begin
                    done <= 0;
                    sh <= 0;
                    load <= 0;
                    ld_acc <= 0;
                    state <= SHIFT;
                end

                END_ST: begin
                    done <= 1;
                    sh <= 0;
                    load <= 0;
                    ld_acc <= 0;
                    wait_cnt <= wait_cnt + 1;
                    state <= (wait_cnt > 25) ? START : END_ST;
                end

                default: state <= START;
            endcase
        end
    end
endmodule
