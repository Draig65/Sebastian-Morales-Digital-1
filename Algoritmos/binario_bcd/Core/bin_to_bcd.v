module bin_to_bcd(
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
    wire [3:0] w_add_high;
    wire [3:0] w_add_low;

    lsr_bcd lsr0 (
        .clk(clk),
        .rst(rst),
        .load(w_load),
        .shift(w_sh),
        .ld_acc(w_ld_acc),
        .in_data(in_data),
        .add_high(w_add_high),
        .add_low(w_add_low),
        .r0(w_r0),
        .result(result)
    );

    comp_bcd comp_high (
        .nibble_in(w_r0[15:12]),
        .nibble_out(w_add_high)
    );

    comp_bcd comp_low (
        .nibble_in(w_r0[11:8]),
        .nibble_out(w_add_low)
    );

    counter_bcd counter0 (
        .clk(clk),
        .rst(rst),
        .load(w_load),
        .dec(w_sh),
        .count(),
        .z(w_z)
    );

    control_bcd control0 (
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
