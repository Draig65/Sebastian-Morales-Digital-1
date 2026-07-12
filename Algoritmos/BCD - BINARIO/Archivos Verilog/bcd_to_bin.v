module bcd_to_bin(
    input clk,
    input rst,
    input init,
    input [7:0] in_data,
    output [7:0] result,
    output done
);

    wire w_sh;
    wire w_load;
    wire w_ld_acc;
    wire w_z;
    wire [15:0] w_r0;
    wire [3:0] w_sub_high;
    wire [3:0] w_sub_low;

    rsr_bin rsr0 (
        .clk(clk),
        .rst(rst),
        .load(w_load),
        .shift(w_sh),
        .ld_acc(w_ld_acc),
        .in_data(in_data),
        .sub_high(w_sub_high),
        .sub_low(w_sub_low),
        .r0(w_r0),
        .result(result)
    );

    comp_bin comp_high (
        .nibble_in(w_r0[15:12]),
        .nibble_out(w_sub_high)
    );

    comp_bin comp_low (
        .nibble_in(w_r0[11:8]),
        .nibble_out(w_sub_low)
    );

    counter_bin counter0 (
        .clk(clk),
        .rst(rst),
        .load(w_load),
        .dec(w_sh),
        .count(),
        .z(w_z)
    );

    control_bin control0 (
        .clk(clk),
        .rst(rst),
        .init(init),
        .z(w_z),
        .done(done),
        .sh(w_sh),
        .load(w_load),
        .ld_acc(w_ld_acc)
    );

endmodule
